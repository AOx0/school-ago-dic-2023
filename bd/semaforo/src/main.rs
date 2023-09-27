use axum::{
    extract::State,
    http::{header, StatusCode},
    response::IntoResponse,
    routing::get,
    Router, Server,
};
use axum_extra::extract::{
    cookie::{Cookie, Key},
    PrivateCookieJar,
};
use std::sync::{Arc, Mutex};

async fn root(State(state): State<AppState>, jar: PrivateCookieJar) -> impl IntoResponse {
    let mut lock = state.lock.lock().unwrap();

    if lock.is_none() {
        let uuid = uuid::Uuid::new_v4().to_string();
        let updated_jar = jar.add(Cookie::new("secret", uuid.clone()));
        *lock = Some(uuid.clone());
        (
            [(header::CONTENT_TYPE, "text/plain")],
            updated_jar,
            std::fs::read_to_string("./Cargo.toml").unwrap(),
        )
    } else if let Some(secret) = jar.get("secret") {
        if matches!(&*lock, Some(s) if secret.value() == s) {
            (
                [(header::CONTENT_TYPE, "text/plain")],
                jar,
                std::fs::read_to_string("./Cargo.toml").unwrap(),
            )
        } else {
            let updated_jar = jar.remove(Cookie::named("secret"));
            (
                [(header::CONTENT_TYPE, "text/plain")],
                updated_jar,
                "Bloqueado".to_string(),
            )
        }
    } else {
        (
            [(header::CONTENT_TYPE, "text/plain")],
            jar,
            "Bloqueado".to_string(),
        )
    }
}

async fn release(State(state): State<AppState>, jar: PrivateCookieJar) -> impl IntoResponse {
    if let Some(secret) = jar.get("secret") {
        let mut lock = state.lock.lock().unwrap();
        if matches!(&*lock, Some(s) if secret.value() == s) {
            let updated_jar = jar.remove(Cookie::named("secret"));
            *lock = None;
            return (
                [(header::CONTENT_TYPE, "text/plain")],
                updated_jar,
                "Liberado".to_string(),
            );
        }
    }
    (
        [(header::CONTENT_TYPE, "text/plain")],
        jar,
        "Sin permiso".to_string(),
    )
}

#[derive(Clone)]
struct AppState {
    lock: Arc<Mutex<Option<String>>>,
    key: Key,
}

impl axum::extract::FromRef<AppState> for Key {
    fn from_ref(state: &AppState) -> Self {
        state.key.clone()
    }
}

#[tokio::main]
async fn main() {
    let state = AppState {
        lock: Arc::new(Mutex::new(None)),
        key: Key::generate(),
    };
    let router = Router::new()
        .route("/", get(root))
        .route("/release", get(release))
        .with_state(state);

    Server::bind(&"[::]:8080".parse().unwrap())
        .serve(router.into_make_service())
        .await
        .unwrap()
}

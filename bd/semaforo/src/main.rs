use axum::{extract::State, http::header, response::IntoResponse, routing::get, Router, Server};
use axum_extra::extract::{
    cookie::{Cookie, Key},
    PrivateCookieJar,
};
use std::sync::{Arc, Mutex};

const TEXT: [(header::HeaderName, &str); 1] = [(header::CONTENT_TYPE, "text/plain")];

async fn root(State(state): State<AppState>, jar: PrivateCookieJar) -> impl IntoResponse {
    let mut lock = state.lock.lock().unwrap();

    if lock.is_none() {
        let uuid = uuid::Uuid::new_v4().to_string();
        let jar = jar.add(Cookie::new("secret", uuid.clone()));
        *lock = Some(uuid.clone());
        (TEXT, jar, std::fs::read_to_string("./Cargo.toml").unwrap()).into_response()
    } else if let Some(secret) = jar.get("secret") {
        if matches!(&*lock, Some(s) if secret.value() == s) {
            (TEXT, jar, std::fs::read_to_string("./Cargo.toml").unwrap()).into_response()
        } else {
            let jar = jar.remove(Cookie::named("secret"));
            (TEXT, jar, "Bloqueado").into_response()
        }
    } else {
        (TEXT, jar, "Bloqueado").into_response()
    }
}

async fn release(State(state): State<AppState>, jar: PrivateCookieJar) -> impl IntoResponse {
    if let Some(secret) = jar.get("secret") {
        let mut lock = state.lock.lock().unwrap();
        if matches!(&*lock, Some(s) if secret.value() == s) {
            let jar = jar.remove(Cookie::named("secret"));
            *lock = None;
            return (TEXT, jar, "Liberado");
        }
    }
    (TEXT, jar, "Sin permiso")
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
        .route("/lock", get(root))
        .route("/release", get(release))
        .with_state(state);

    Server::bind(&"[::]:8080".parse().unwrap())
        .serve(router.into_make_service())
        .await
        .unwrap()
}

use axum::{extract::State, http::header, response::IntoResponse, routing::get, Router, Server};
use std::sync::{Arc, Mutex};

async fn root(State(lock): State<Arc<Mutex<bool>>>) -> impl IntoResponse {
    let mut lock = lock.lock().unwrap();

    if !(*lock) {
        *lock = true;
        (
            [(header::CONTENT_TYPE, "text/plain")],
            std::fs::read_to_string("./Cargo.toml").unwrap(),
        )
    } else {
        (
            [(header::CONTENT_TYPE, "text/plain")],
            "Bloqueado".to_string(),
        )
    }
}

#[tokio::main]
async fn main() {
    let state = Arc::new(Mutex::new(false));
    let router = Router::new().route("/", get(root)).with_state(state);

    Server::bind(&"[::]:8080".parse().unwrap())
        .serve(router.into_make_service())
        .await
        .unwrap()
}

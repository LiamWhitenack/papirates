import gleam/erlang/process
import mist
import wisp
import wisp/wisp_mist

pub fn main() {
  wisp.configure_logger()

  let secret_key_base = wisp.random_string(64)

  let assert Ok(_) =
    wisp_mist.handler(handle_request, secret_key_base)
    |> mist.new
    |> mist.port(8080)
    |> mist.start

  process.sleep_forever()
}

fn handle_request(req: wisp.Request) -> wisp.Response {
  case wisp.path_segments(req) {
    [] ->
      wisp.ok()
      |> wisp.html_body("<h1>Hello, World!</h1>")

    _ -> wisp.not_found()
  }
}

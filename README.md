# TreehouseGen

To start your Phoenix server:

* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Deploying to Fly.io

- Pushes to `main` trigger `.github/workflows/fly-deploy.yml`, which deploys the app to Fly.io using the `production` GitHub Actions environment.
- `fly.toml` is configured for a single shared CPU VM with 256 MB RAM and `min_machines_running = 0` to keep costs down.
- Before the first deploy, set the required Fly secret:

  ```sh
  flyctl secrets set SECRET_KEY_BASE="$(mix phx.gen.secret)" --app treehouse-gen
  ```

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix

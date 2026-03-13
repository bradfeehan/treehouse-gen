# TreehouseGen

To start your Phoenix server:

* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Deploying to Fly.io

This repository includes:

* `Dockerfile` for building a Phoenix release
* `fly.toml` for the Fly.io app configuration
* `.github/workflows/deploy-fly.yml` to deploy on every push to `main` or via manual dispatch

### GitHub Actions secrets to add

Required:

* `FLY_API_TOKEN` - Fly.io deploy token
* `FLY_APP_NAME` - the Fly.io app name to create or deploy
* `SECRET_KEY_BASE` - Phoenix production secret

Optional:

* `PHX_HOST` - custom production hostname; defaults to `<FLY_APP_NAME>.fly.dev`
* `DNS_CLUSTER_QUERY` - custom clustering query; defaults to `<FLY_APP_NAME>.internal`
* `MAILGUN_API_KEY` - only needed if you enable the Mailgun mailer in production
* `MAILGUN_DOMAIN` - only needed if you enable the Mailgun mailer in production

### How to create each secret

#### `FLY_API_TOKEN`

1. Install and authenticate the Fly CLI: `fly auth login`
2. Create a deploy token:

   ```sh
   fly tokens create deploy
   ```

3. Copy the token value into the GitHub Actions secret named `FLY_API_TOKEN`

#### `FLY_APP_NAME`

Choose a globally unique Fly app name, for example `treehouse-gen-prod`, and store that value as the GitHub Actions secret `FLY_APP_NAME`.

The deploy workflow will create the Fly app automatically on the first deployment if it does not already exist.

#### `SECRET_KEY_BASE`

Generate a Phoenix secret locally:

```sh
mix phx.gen.secret
```

Copy the generated value into the GitHub Actions secret named `SECRET_KEY_BASE`.

#### Optional secrets

* If you want a custom hostname instead of `https://<FLY_APP_NAME>.fly.dev`, add it as `PHX_HOST`
* If you want to override clustering, add `DNS_CLUSTER_QUERY`
* If you configure the production mailer, add `MAILGUN_API_KEY` and `MAILGUN_DOMAIN`

### First deploy

After the secrets are configured in GitHub:

1. Push to `main`, or run the **Deploy to Fly.io** workflow manually from the GitHub Actions tab
2. The workflow will:
   * create the Fly app if needed
   * sync the runtime secrets into Fly
   * build and deploy the release with `flyctl deploy --remote-only`

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix

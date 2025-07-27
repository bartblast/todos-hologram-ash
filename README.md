# Todos

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Project Setup

```sh
# new phoenix project
mix phx.new todos
cd todos

# install ash
mix igniter.install ash ash_phoenix ash_postgres --yes
mix ash.setup

# install hologram
```

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
  * Ash: https://hexdocs.pm/ash/readme.html
  * Ash Postgres: https://hexdocs.pm/ash_postgres/readme.html
  * Hologram: https://hologram.page/

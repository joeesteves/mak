# Mak

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
## To genereate i18n files
```shell
mix i18n
```

## To Deploy

### cd assets && yarn build
### MIX_ENV=prod mix ecto.drop
### MIX_ENV=prod mix ecto.create
### MIX_ENV=prod mix ecto.migrate
### mix phx.digest
### PORT=4001 MIX_ENV=prod mix phx.server

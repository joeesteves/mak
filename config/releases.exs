import Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :mak, Mak.Repo,
  # ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :mak, MakWeb.Endpoint,
  url: [host: System.get_env("HOST"), scheme: "https", port: 443],
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
config :teamplace, :credentials, %{
  client_id: System.get_env("TEAMPLACE_CLIENT_ID"),
  client_secret: System.get_env("TEAMPLACE_CLIENT_SECRET")
}

config :teamplace,
  api_base: System.get_env("TEAMPLACE_API_BASE")

config :mak, MakWeb.Endpoint, server: true

#
# Then you can assemble a release by Makling `mix release`.
# See `mix help release` for more information.


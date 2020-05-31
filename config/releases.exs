import Config

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :view_forms, ViewFormsWeb.Endpoint,
  http: [port: 4000],
  url: [scheme: "https", host: System.get_env("PUBLIC_HOST"), port: 443],
  secret_key_base: secret_key_base


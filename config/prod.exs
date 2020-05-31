use Mix.Config

config :view_forms, ViewFormsWeb.Endpoint,
  server: true,
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

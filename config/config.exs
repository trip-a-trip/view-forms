# General application configuration
use Mix.Config

# Configures the endpoint
config :view_forms, ViewFormsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pSJ2CbHjpTUhhdUpaBR2Mrhd6tZi8Jiz+vAJmaxccebHAxStWLitxImvGxNw8ZUn",
  render_errors: [view: ViewFormsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ViewForms.PubSub,
  live_view: [signing_salt: "bXQW1UH2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

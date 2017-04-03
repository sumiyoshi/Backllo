
use Mix.Config

# Configures the endpoint
config :backllo, Backllo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9II/8m+jluYKA3Ho66A4WG3ABipL66yFUQTpCRWPH3WXwB+p8RiBXc1LaeZDDO0p",
  render_errors: [view: Backllo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Backllo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env}.exs"
import_config "backlog.secret.exs"

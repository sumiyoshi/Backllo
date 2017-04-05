use Mix.Config

config :backllo, Backllo.Endpoint,
  http: [:inet6, port: {:system, "PORT"}],
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/manifest.json"

# Do not print debug messages in production
config :logger, level: :info

import_config "prod.secret.exs"
import_config "backlog.secret.exs"
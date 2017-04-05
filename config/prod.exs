use Mix.Config

config :backllo, Backllo.Endpoint,
  http: [port: 80],
  url: [host: "example.com"],
  root: ".",
  cache_static_manifest: "priv/static/manifest.json",
  server: true,
  version: Mix.Project.config[:version]

# Do not print debug messages in production
config :logger, level: :info

import_config "prod.secret.exs"
import_config "backlog.secret.exs"
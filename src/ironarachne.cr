require "logger"
require "orion"
require "./helpers/*"
require "./controllers/*"

VERSION = "0.1.0"

log = Logger.new(STDOUT)

log.info("Iron Arachne version " + VERSION + " initializing...")

router IronArachneRouter do
  use HTTP::LogHandler.new
  root to: "root#index"
  get "/region", to: "region#index"
  use HTTP::StaticFileHandler.new("public/", directory_listing = false)
end

log.info("Listening on port 3000")
IronArachneRouter.listen

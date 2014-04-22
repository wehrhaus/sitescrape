express = require "express"
path = require "path"
stylus = require "stylus"
bootstrap = require "bootstrap-stylus"
TinyUrl = require "nj-tinyurl"
port = process.env.PORT || 16750
env = process.env.environment || "development"
app = express()

compile = (str, path)->
    stylus(str).set("filename", path).use bootstrap()
    
app.use stylus.middleware(
    src: __dirname + "/public"
    compile: compile
)

app.set "view engine", "jade"
app.set "view options", layout: false
app.use express.bodyParser()

app.configure "development", () ->
    console.log "-->development<--"
    app.use express.logger "dev"
    app.set "view options", pretty: true
    app.use express.errorHandler { dumpExceptions: true, showStack: true }
    
app.configure "production", () ->
    console.log "-->production<--"
    app.use express.errorHandler()
    
app.use require("connect-assets")()
app.use express.static __dirname + "/public"

app.use require("./controllers/router")

console.log "sitescrape listening on #{port} in #{env} environment"
app.listen port
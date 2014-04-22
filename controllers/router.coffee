# TinyUrl = require 'nj-tinyurl'
express = require "express"
app = module.exports = express()

app.get "/", (req, res) ->
    res.render "welcome", title: "Welcome"
    
app.post "/amass", (req, res) ->
    
    {exec} = require "child_process"
    randomized = require("./SiteScrape")
    urlSet = randomized.genRandomValue 24
    phantomStatic = "public/images/screenshots/" + urlSet + ".png"
    imagePath = "images/screenshots/" + urlSet + ".png"
    phantomArgs = req.body.url + " " + phantomStatic + " " + req.body.width + " " + req.body.height + " " + req.body.username + " " + req.body.password
    console.log phantomArgs
    screenShot = exec "phantomjs services/screenshot.coffee " + phantomArgs, (error, stdout, stderr) ->
        console.log "stdout: " + stdout
        if stdout isnt null
            # console.log phantomStatic
            # shortenUrl = TinyUrl.shorten( phantomStatic, (err, urlToFull)->
            #     console.log urlToFull
            # )
            res.render "screenshot", title: "Results", fullImage: imagePath, data: req.body
        if error isnt null
            console.log "exec error: " + error
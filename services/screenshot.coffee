page = require( "webpage" ).create()

if phantom.args.length < 2 || phantom.args.length > 6
    console.log "ERROR-> BadArgs | Usage: sitescrape.js @URL @saveAs @width @height (optional @username @password)"
    phantom.exit()
else
    page.settings.javascriptEnabled = true
    page.settings.loadImages = true
    address = phantom.args[0]
    output = phantom.args[1]
    page.viewportSize = { width: phantom.args[2], height: phantom.args[3] }
    page.settings.userName = phantom.args[4]
    page.settings.password = phantom.args[5]
    page.open address, (status) ->
        if status isnt "success"
            console.log "ERROR-> Address | Unable to load the address #{address}"
            phantom.exit()
        else
            t = ->
                page.render output
                console.log "SUCCESS-> Screenshot Build Complete"
                phantom.exit()
            timer = window.setTimeout t, 300
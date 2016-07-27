# Create the Application
app = new Marionette.Application
  onStart: (options)->
    # Start Router
    Router = require('./routers/router.coffee')
    router = new Router(options)

    # Starts the URL handling framework
    Backbone.history.start()
app.start()

module.exports = Marionette.Object.extend
  initialize: ->
    @createPlayersCollection()

    # Create layout View
    Layout = require('../views/layout.coffee')

    @layout = new Layout()

    @layout.on 'render', =>
      @showNavbar()

    # Render Layout View
    @layout.render()

  createPlayersCollection: ->
    PlayersCollection = require '../collections/players.coffee'

    # initialize players Collection
    @playersCollection = new PlayersCollection()

    # Add create user model in players collection
    @playersCollection.add
      isCreate: true

  showNavbar: ->
    # import navbar view
    NavbarView = require('../views/navbar.coffee')
    # initialize navbar view
    navbarView = new NavbarView()

    navbarView.on 'handle:navigate', (route)=>
      if route is 'Rounds'
        Backbone.history.navigate('rounds')
        @showRounds()
      else
        Backbone.history.navigate('')
        @showPlayers()
    # show navbarView
    @layout.headerRegion.show navbarView

  showPlayers: ->
    # import player view
    PlayersView = require('../views/players.coffee')
    # initialize player view
    playersView = new PlayersView
      collection: @playersCollection

    playersView.on 'childview:handle:click:start:game', =>
      @showRounds()

    playersView.on 'childview:handle:submit', (childView, username)->
      return false if username.length < 3
      return false if @collection.findWhere(name: username)

      playerModel = @collection.add
        id: @collection.length + 1
        name: username

      childView.triggerMethod 'clear:input'

    # show playerView
    @layout.contentRegion.show playersView

  showRounds: ->
    RoundsView = require '../views/rounds.coffee'
    roundsView = new RoundsView
      collection: @playersCollection

    roundsView.on 'handle:click:next:round', ->
      @collection.models.forEach (model)->
        unless model.get('isCreate')
          model.set
            total: (model.get('total') + model.get('score'))

    @layout.contentRegion.show roundsView

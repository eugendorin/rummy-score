Controller = require '../controllers/controller.coffee'

module.exports = Marionette.AppRouter.extend
  appRoutes:
    '': 'showPlayers'
    'rounds': 'showRounds'
  controller: new Controller()

module.exports = Marionette.CompositeView.extend
  template: require '../templates/rounds.hbs'

  childView: require './round.coffee'
  childViewContainer: '[data-region="rounds-collection"]'
  events:
    'click [data-action="next-round"]': 'eventActionClickNextRound'

  filter: (playerModel)->
    return playerModel.get('isCreate') is false

  eventActionClickNextRound: (ev)->
    ev.preventDefault()

    @trigger 'handle:click:next:round'

    return false

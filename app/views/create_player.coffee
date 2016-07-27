module.exports = Marionette.ItemView.extend
  template: require '../templates/create_player.hbs'
  tagName: 'form'

  ui:
    input: '[data-ui="input"]'

  events:
    'submit': 'eventActionSubmit'
    'click [data-action="start-game"]': 'eventActionClickStartGame'

  eventActionSubmit: (ev)->
    ev.preventDefault()

    @trigger 'handle:submit', @ui.input.val()

    return false

  eventActionClickStartGame: (ev)->
    ev.preventDefault()

    @trigger 'handle:click:start:game'

    return false

  onClearInput: ->
    @ui.input.val("")

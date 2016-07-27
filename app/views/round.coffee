module.exports = Marionette.ItemView.extend
  template: require('../templates/round.hbs')

  events:
    'input [data-action="score"]': 'eventActionChangeScore'

  ui:
    score: '[data-ui="score"]'

  modelEvents:
    'change:total': 'onChangeScore'

  eventActionChangeScore: (ev)->
    @model.set 'score', +$(ev.target).val()

  onChangeScore: ->
    @ui.score.text(@model.get 'total')

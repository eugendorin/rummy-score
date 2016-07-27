
module.exports = Marionette.CollectionView.extend
  tagName: 'ul'
  className: 'collection'

  getChildView: (playerModel)->
    if playerModel.get('isCreate')
      return require('./create_player.coffee')
    else
      return require('./player.coffee')

   viewComparator: (playerModel)->
     return playerModel.get('isCreate') is true

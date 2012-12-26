window.TestTask =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new TestTask.Routers.Projects()
    Backbone.History.start()

$(document).ready ->
  TestTask.initialize()

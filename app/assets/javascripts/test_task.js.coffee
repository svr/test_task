window.TestTask =
  Models: {}
  Collections: {}
  Views: {}
  Preloaded: {}
  Routers: {}
  RouteInstances: {}
  initialize: ->
    window.TestTask.RouteInstances.ProjectsRoute = new TestTask.Routers.Projects()
    Backbone.history.start({pushState: true})

$(document).ready ->
  TestTask.initialize()

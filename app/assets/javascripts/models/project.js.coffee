class TestTask.Models.Project extends Backbone.Model
  urlRoot: '/api/projects'
  initialize: ->
    @tasks = new TestTask.Collections.Tasks
    @tasks.url = @url() + '/tasks'

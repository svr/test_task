class TestTask.Models.Project extends Backbone.Model
  urlRoot: '/api/projects'
  initialize: ->
    @tasks = new TestTask.Models.Task
    @tasks.url = @this.url() + '/tasks'

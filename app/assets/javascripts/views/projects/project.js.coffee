class TestTask.Views.ProjectItem extends Backbone.View
  template: JST['projects/project_item']
  tagName: 'li'

  initialize: ->
    _.bindAll(this, 'render') 
    @model.on('change', @render, this)

  events: 
    'click .add-tasks'      : 'addTasks'
    'click .edit-project'   : 'editProject'
    'click .remove-project' : 'removeProject'

  addTasks: (event) ->
    event.preventDefault()
    TestTask.RouteInstances.ProjectsRoute.navigate('/projects/' + @model.id, true)

  editProject: (event) ->
    event.preventDefault()
    console.log('Editing project')
    @model.collection.trigger("project:edit", @model)

  removeProject: (event) ->
    event.preventDefault()
    if confirm('Delete project ' + @model.get('name') + '?')
      @model.destroy()
      @remove()

  render: -> 
    @$el.empty().append(@template(project: @model))
    this

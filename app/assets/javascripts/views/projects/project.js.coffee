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
    'click a'               : 'addTasks'

  addTasks: (event) ->
    event.preventDefault()
    event.stopPropagation();
    TestTask.RouteInstances.ProjectsRoute.navigate('/projects/' + @model.id, true)

  editProject: (event) ->
    event.preventDefault()
    event.stopPropagation();
    @model.collection.trigger("project:edit", @model)

  removeProject: (event) ->
    event.preventDefault()
    event.stopPropagation();
    if confirm('Delete project ' + @model.get('name') + '?')
      @model.destroy()
      @remove()

  render: -> 
    @$el.empty().append(@template(project: @model))
    this

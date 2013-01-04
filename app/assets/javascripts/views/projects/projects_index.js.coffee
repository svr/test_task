class TestTask.Views.ProjectsIndex extends Backbone.View

  template: JST['projects/index']
  initialize: ->
    _.bindAll(this, 'render') 
    @collection.on('reset', @render, this)
    @collection.on('add',   @appendProject, this)
    @collection.on('project:edit', @renderProjectForm, this)


  events:
    'click .new-project' : 'newProjectForm'
    'submit form'        : 'createProject'
    #'click .save'       : 'createProject'
    'click .cancel'      : 'render'

  appendProject: (project) -> 
    item_view = new TestTask.Views.ProjectItem(model: project)
    @project_list_el.append(item_view.render().el)

  newProjectForm: (event) ->
    event.preventDefault()
    @renderProjectForm( new TestTask.Models.Project() )
    #@project_form = new Backbone.Form(model: @new_project)
    #@$el.find('#projects').empty().append('<div>Add new project</div>').append(@new_project_form.render().el)

  renderProjectForm: (project) ->
    @project = project
    @project_form = new Backbone.Form(model: @project)
    @$el.find('#projects').empty().append(@project_form.render().el)

  createProject: (event) ->
    event.preventDefault()
    console.log('saving project')
    errors = @project_form.commit();
    if _.isEmpty errors
      @project.save({},  success: =>
        @project.setTasksUrl()
        @collection.add(@project)
        @render()
      )
    return false

  render: ->
    @$el.empty().append(@template())
    @project_list_el = @$el.find('#projects-list')
    @collection.each(@appendProject, this)
    return false

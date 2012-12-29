class TestTask.Views.ProjectsIndex extends Backbone.View

  template: JST['projects/index']
  initialize: ->
    _.bindAll(this, 'render') 
    @collection.on('reset', @render, this)
    @collection.on('add',   @appendProject, this)

  appendProject: (project) -> 
    item_view = new TestTask.Views.ProjectItem(model: project)
    @project_list_el.append(item_view.render().el)

  render: ->
    @$el.empty().append(@template())
    @project_list_el = @$el.find('#projects-list')
    @collection.each(@appendProject, this)

class TestTask.Routers.Projects extends Backbone.Router
  routes:
    ''                  : 'index'
    'index'             : 'index'
    'projects'          : 'showProjects'
    'projects/:id'      : 'showProject'
    
  initialize: ->
    @projects = TestTask.Preloaded.Projects;
    @main_element = $('#content')

  showProjects: ->
   @index_view = new TestTask.Views.ProjectsIndex(collection:  @projects, el: @main_element)
   @index_view.render()

  showProject: (id) ->
    project = @projects.get(id)
    if project
      project_view = new TestTask.Views.ProjectTask(model: project, el: @main_element)
      project_view.render()
    else
      @navigate('/', {trigger: true})

  index: ->
    @showProjects()


class TestTask.Views.ProjectTask extends Backbone.View

  template: JST['projects/project_tasks']
  initialize: ->
    @itemView = TestTask.Views.TaskItem
    @tasks = @model.tasks
    @tasks.fetch()
    @tasks.on('reset', @render, this)
    @tasks.on('add', @appendTask, this)
    @tasks.on('edit_form', @editTaskForm, this)

  events: 
    'click .add-task' : 'addTask'
    'click .cancel'   : 'render'
    'click .save'     : 'saveTask'
    'submit'          : 'saveTask'

  addTask: (event) ->
    event.preventDefault()
    task_name_el = @$el.find('#task-name')
    task_name = task_name_el.val()
    task_name_el.val('')
    task = new TestTask.Models.Task({name: task_name})
    task.urlRoot = @model.url() + '/tasks'
    task.save({}, {
               success:  =>
                 @tasks.add(task) 
              })

  saveTask: (event) ->
    event.preventDefault()
    errors = @task_form.commit()
    if(_.isEmpty(errors))
      @task_form.model.save(
        {},
        success: =>
          @render()
      )
    return false

  editTaskForm: (task) ->
    @task_form = new Backbone.Form(model: task)
    @$el.empty().append(@task_form.render().el)

  appendTask: (project) ->
    item_view = new @itemView(model: project)
    @itemViewEl.append(item_view.render().el)

  render: ->
    @$el.empty().append(@template(project: @model))
    @itemViewEl = @$el.find('tbody')
    @tasks.each(@appendTask, this)

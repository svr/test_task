class TestTask.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']
  tagName: 'table'

  initialize: ->
    @itemView = TestTask.Views.TaskItem
    @collection = @model.tasks
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTask, this)

  appendProject: (task) ->
    item_view = new @itemView(model: task)
    @$el.append(item_view.render().el)


  render: ->
    @$el.empty().append(@template())
    @collection.each(@appendTask)
    this

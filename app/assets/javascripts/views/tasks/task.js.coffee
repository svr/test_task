class TestTask.Views.TaskItem extends Backbone.View
  template: JST['tasks/task_item']
  tagName: 'tr'

  initialize: ->
    _.bindAll(this, 'render')
    @model.on('change', @render, this)

  render: -> 
    @$el.empty().append(@template(task: @model))
    this

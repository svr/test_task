class TestTask.Views.TaskItem extends Backbone.View
  template: JST['tasks/task_item']
  tagName: 'tr'

  initialize: ->
    _.bindAll(this, 'render')
    @model.on('change',  @render, this)
    @model.on('destroy', @remove, this)

  events:
    'click .remove-task' : 'removeTask'
    'click .edit-task'   : 'editTask'

  removeTask: (event) ->
    event.preventDefault()
    if(confirm('Remove task "' + @model.get('name') + '" ?'))
      @model.destroy
        wait: true
        
  editTask: (event) ->
    event.preventDefault()
    @model.collection.trigger('edit_form', @model)
      
  render: -> 
    @$el.empty().append(@template(task: @model))
    this

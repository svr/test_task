class TestTask.Models.Project extends Backbone.Model
  urlRoot: '/api/projects'
  initialize: ->
    @tasks = new TestTask.Collections.Tasks
    if !@isNew()
      @setTasksUrl()
    @tasks.url = @url() + '/tasks'
    templates = {
       form_buttons: '<div class="control-group">
                      <div class="controls">
                      <button class="cancel btn">Cancel</button>
                      <button class="save btn btn-success" type="submit">Save</button>
                      </div></div'
    }
    Backbone.Form.setTemplates(templates)

  setTasksUrl: ->
    @tasks.url = @url() + '/tasks'
  schema:
    name: {type: 'Text', validators: ['required']}
    form_buttons:{template: 'form_buttons'}

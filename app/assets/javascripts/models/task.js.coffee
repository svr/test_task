class TestTask.Models.Task extends Backbone.Model
  defaults:
  #Tomorrow date, in 24 hours 60 minutes 60 seconds 1000 milliseconds
    deadline_at: new Date(new Date().getTime() + 24 * 60 * 60 * 1000)  
    priority: 0
  schema:
    name: 
      type: 'Text', 
      validators: ['required']
    deadline_at: 
      type: 'DateTime'
      title: 'Deadline'
      yearStart: (new Date()).getFullYear()
      yearEnd: (new Date()).getFullYear() + 10
      minsInterval: 5
    priority: 
      type: 'Text'
      dataType: 'number'
      editorAttrs:
        min: 0
      validators: [
        { type: 'regexp', regexp: /^\d+$/,  message: 'Should be digits only!' }
      ]

    form_buttons:{template: 'form_buttons'}


  initialize: ->
    templates = 
       form_buttons: '<div class="control-group">
                        <div class="controls">
                          <button class="cancel btn">Cancel</button>
                          <button class="save btn btn-success" type="submit">Save</button>
                        </div>
                      </div>'
    
    Backbone.Form.setTemplates(templates)


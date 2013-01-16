class TestTask.Collections.Tasks extends Backbone.Collection

  model: TestTask.Models.Task
  comparator: (task) -> 
    return -task.get('priority')

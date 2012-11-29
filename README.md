test_task
=========

Test task for RoR course http://rorcourse.herokuapp.com/course/test_task

### SQL TASK:
Given tables:

    tasks (id, name, status, project_id)
    projects (id, name)

* get all statuses, not repeating, alphabetically ordered
 
    SELECT DISTINCT status FROM tasks ORDER BY status;

* get the count of all tasks in each project, order by tasks count descending

    SELECT COUNT(*) FROM tasks GROUP BY project_id ORDER BY COUNT(*) DESC;
    
* get the count of all tasks in each project, order by projects names
 
    SELECT COUNT(*) FROM tasks INNER JOIN projects ON tasks.project_id = projects.id GROUP BY project_id ORDER BY prejects.name DESC;

* get the tasks for all projects having the name beginning with “N” letter

    SELECT * FROM tasks INNER JOIN projects ON tasks.project_id = projects.id WHERE projects.name LIKE 'N%';

* get the list of all projects containing the ‘a’ letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL

* get the list of tasks with duplicate names. Order alphabetically

    SELECT t1.name FROM task t1 INNER JOIN tasks t2 ON t1.name = t2.name AND t1.id != t2.id ORDER by t1.name;

* get the list of tasks having several exact matches of both name and status, from the project ‘Garage’. Order by matches count

    SELECT t1.name FROM tasks t1 INNER JOIN tasks t2 ON t1.name = t2.name AND t1.status = t2.status AND t1.id != t2.id 
      INNER JOIN projects ON t1.project_id = projects.id  WHERE projects.name = 'Garage'
      GROUP BY t1.name ORDER BY COUNT(*);
  
* get the list of project names having more than 10 tasks in status ‘completed’. Order by project_id
   
    SELECT projects.name FROM projects INNER JOIN tasks ON projects.id = tasks.id AND tasks.status = 'completed' GROUP BY tasks.project_id HAVING COUNT(*) > 10 ORDER BY project_id;

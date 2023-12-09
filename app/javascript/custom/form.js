document.addEventListener('turbo:load', function() {
  let selectAll = document.getElementById('select-all');
  let deselectAll = document.getElementById('deselect-all');
  let sortTasksButton = document.getElementById('sort-tasks-button');

  if (selectAll) {
    selectAll.addEventListener('click', function() {
      let checkboxes = document.querySelectorAll('input[type=checkbox]');
      for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].id != 'schedule_tasks_attributes_0_goal_select') {
          checkboxes[i].checked = true;
        }
      }
    });
  }

  if (deselectAll) {
    deselectAll.addEventListener('click', function() {
      let checkboxes = document.querySelectorAll('input[type=checkbox]');
      for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].id != 'schedule_tasks_attributes_0_goal_select') {
          checkboxes[i].checked = false;
        }
      }
    });
  }

  if (sortTasksButton) {
    sortTasksButton.addEventListener('click', function() {
      let sortedTasks = Array.from(document.querySelectorAll('.nested-fields')).sort(function(a, b) {
        let timeA = a.querySelector('select[name$="[task_time(4i)]"]').value + ':' + a.querySelector('select[name$="[task_time(5i)]"]').value;
        let timeB = b.querySelector('select[name$="[task_time(4i)]"]').value + ':' + b.querySelector('select[name$="[task_time(5i)]"]').value;
        return timeA > timeB ? 1 : -1;
      });

      let tasksContainer = document.getElementById('tasks-container');
      sortedTasks.forEach(function(taskFields) {
        tasksContainer.appendChild(taskFields);
      });
    });
  }
});

document.getElementById('select-all').addEventListener('click', function() {
  var checkboxes = document.querySelectorAll('input[type=checkbox]');
  for (var i = 0; i < checkboxes.length; i++) {
    if (checkboxes[i].id != 'schedule_tasks_attributes_0_goal_select') {
      checkboxes[i].checked = true;
    }
  }
});
document.getElementById('deselect-all').addEventListener('click', function() {
  var checkboxes = document.querySelectorAll('input[type=checkbox]');
  for (var i = 0; i < checkboxes.length; i++) {
    if (checkboxes[i].id != 'schedule_tasks_attributes_0_goal_select') {
      checkboxes[i].checked = false;
    }
  }
});

document.getElementById('sort-tasks-button').addEventListener('click', function() {
  // タスクのフォームフィールドを時間順に並び替え
  var sortedTasks = Array.from(document.querySelectorAll('.nested-fields')).sort(function(a, b) {
    var timeA = a.querySelector('select[name$="[task_time(4i)]"]').value + ':' + a.querySelector('select[name$="[task_time(5i)]"]').value;
    var timeB = b.querySelector('select[name$="[task_time(4i)]"]').value + ':' + b.querySelector('select[name$="[task_time(5i)]"]').value;
    return timeA > timeB ? 1 : -1;
  });

  // 並び替えたタスクのフォームフィールドを挿入
  var tasksContainer = document.getElementById('tasks-container');
  sortedTasks.forEach(function(taskFields) {
    tasksContainer.appendChild(taskFields);
  });
});
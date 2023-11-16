document.addEventListener('DOMContentLoaded', (event) => {
  setInterval(updateNextTask, 60000); // 1分ごとに次のタスクを更新
});

function updateNextTask() {
  fetch('/homes/index.js').then(response => response.text()).then(html => {
    document.getElementById('next-task').innerHTML = html;
  });
}
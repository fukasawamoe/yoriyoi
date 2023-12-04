console.log("HelloWorld")

document.addEventListener("DOMContentLoaded", function() {
  var updateButton = document.getElementById("updateButton");
  if (updateButton) {
    updateButton.addEventListener("click", function() {
      var stepId = this.dataset.stepId; // ボタンのdata-step-id属性からステップIDを取得
      var xhr = new XMLHttpRequest();
      xhr.open("POST", "/steps/" + stepId + "/add_day_check"); // URLにステップIDを追加
      xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
      xhr.send();
    });
  }
});

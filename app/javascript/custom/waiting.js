window.onload = function() {
  setTimeout(function() {
    let loading = document.getElementById("showloading");
    let contents = document.getElementById("contents");
    
    // ローディングのdivを非表示に変更
    if (loading) loading.style.display = "none";

    // メインコンテンツのdivがある場合は表示に変更
    if (contents) contents.style.display = "block";
  }, 2000);
};

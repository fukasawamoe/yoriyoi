// ページが完全にロードされたときに実行される命令をブラウザに伝えます。
document.addEventListener('turbo:load', function() {
  // 'loading'というIDの付いた部分（ローディング画面）を見つけてきます。
  // 'style.display = 'none''というコードで、その部分を画面に表示しないようにします。
  // これが「ロード済みですよ」というサインになります。
  document.getElementById('loading').style.display = 'none';
});

// 新しいページに移る直前に実行される命令をブラウザに伝えます。
document.addEventListener('turbo:before-visit', function() {
  // 再度、'loading'というIDの付いた部分（ローディング画面）を見つけます。
  // 'style.display = 'block''というコードで、今度はその部分を画面に表示するようにします。
  // これが「新しいページの準備をしているのでちょっと待ってね」というサインです。
  document.getElementById('loading').style.display = 'block';
});
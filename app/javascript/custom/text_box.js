document.addEventListener('turbo:load', function() {
  let element = document.getElementById('textbox');
  if (element === null) {
    console.error("Element with id 'textbox' not found");
  } else {
    let textNodes = [];
    let originalTexts = [];
    let i = 0;

    // テキストノードを取得する関数
    function getTextNodes(node) {
      if (node !== null && node.nodeType === Node.TEXT_NODE) {
        textNodes.push(node);
        originalTexts.push(node.nodeValue);
        node.nodeValue = ''; // テキストを非表示にする
      } else {
        for (let child of node.childNodes) {
          getTextNodes(child);
        }
      }
    }

    // テキストノードを一文字ずつ表示する関数
    function typeWriter() {
      if (i < textNodes.length) {
        let text = originalTexts[i];
        let j = 0;
        let intervalId = setInterval(function() {
          if (j < text.length) {
            textNodes[i].nodeValue += text.charAt(j);
            j++;
          } else {
            clearInterval(intervalId);
            i++;
            typeWriter();
          }
        }, 50); // 100ミリ秒ごとに文字を表示
      }
    }

    // テキストノードを取得してタイピングを開始
    getTextNodes(element);
    typeWriter();
  }
});
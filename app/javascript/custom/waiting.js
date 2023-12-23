document.addEventListener('turbo:load', function() {
  document.getElementById('loading').style.display = 'none';
});

document.addEventListener('turbo:before-visit', function() {
  document.getElementById('loading').style.display = 'block';
});

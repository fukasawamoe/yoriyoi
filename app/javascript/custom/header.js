window.addEventListener('turbo:load', function(){
  header_button.addEventListener('click', event => {
    bars.classList.toggle('hidden');
    xmark.classList.toggle('hidden');
    menu.classList.toggle('translate-x-full');
  })
});


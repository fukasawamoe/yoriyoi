  document.addEventListener('turbo:load', () => {
    const input = document.getElementById('image-upload');
    const imagePreview = document.getElementById('preview');

    input.addEventListener('change', (event) => {
      const file = event.target.files[0];
      if (file) {
        imagePreview.style.display = 'block'; // Change inline to block
        imagePreview.src = URL.createObjectURL(file);
      } else {
        imagePreview.style.display = 'none';
      }
    });
  });

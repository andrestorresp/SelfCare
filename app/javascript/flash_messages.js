document.addEventListener('turbo:load', () => {
  const flashMessages = document.querySelectorAll('.alert');

  flashMessages.forEach((message) => {
    setTimeout(() => {
      message.remove();
    }, 5000); // Elimina el mensaje después de 5 segundos (5000 milisegundos)
  });
});

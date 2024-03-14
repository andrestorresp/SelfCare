document.addEventListener('turbo:load', () => {
  const notification = document.querySelector('.alert');
  if (notification) {
    setTimeout(() => {
      notification.remove();
    }, 5000); // Elimina la notificación después de 5 segundos (5000 milisegundos)
  }
});

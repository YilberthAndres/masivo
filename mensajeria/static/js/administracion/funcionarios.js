
  const funcionarioElements = document.querySelectorAll('.circle');

  funcionarioElements.forEach(element => {
    let estado = element.classList[1];
    let mensaje = '';

    switch (estado) {
      case 'Activo':
        mensaje = 'Activo';
        break;
      case 'Suspendido':
        mensaje = 'Suspendido';
        break;
      case 'Retirado':
        mensaje = 'Retirado';
        break;
      default:
        mensaje = 'Desconocido';
    }

    element.setAttribute('title', mensaje);
  });


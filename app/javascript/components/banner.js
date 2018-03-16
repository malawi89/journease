import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  document.getElementById('sweet-alert-demo').addEventListener('click', () => {
    swal({
      title: "Congratulations!",
      text: "A new journey was added",
      icon: "success"
    })
  });
}

swal({
      title: "Congratulations!",
      text: "A new journey was added",
      icon: "success"
    })

export { bindSweetAlertButtonDemo };

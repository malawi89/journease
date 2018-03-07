function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var forminput = document.querySelectorAll('.autocompleter');
    // iterate oer the array for each autocomplete button (form-input)
     // loop
     forminput.forEach((item) => {

            if (item) {
              var autocomplete = new google.maps.places.Autocomplete(item, { types: [ 'geocode' ] });
              google.maps.event.addDomListener(item, 'keydown', function(e) {
                if (e.key === "Enter") {
                  e.preventDefault(); // Do not submit the form on Enter.
                }
              });
            }
      });
  });
}

export { autocomplete };

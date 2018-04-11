import flatpickr from "flatpickr";
import 'flatpickr/dist/themes/material_green.css'
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin'

var startDate = document.querySelector(".flatpickr-start-date").innerHTML;
var endDate = document.querySelector(".flatpickr-end-date").innerHTML;
flatpickr(".flatpicker", {
  altInput: true,
  enableTime: true,
  defaultDate: startDate,
  minDate: startDate,
  maxDate: endDate
});
flatpickr("#start_date", {
  altInput: true,
  "plugins": [new rangePlugin({ input: "#end_date"})]
});


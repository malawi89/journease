import flatpickr from "flatpickr";
import 'flatpickr/dist/themes/material_green.css'
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin'

flatpickr(".flatpicker", {
  altInput: true,
  enableTime: true
});
flatpickr("#start_date", {
  altInput: true,
  "plugins": [new rangePlugin({ input: "#end_date"})]
});

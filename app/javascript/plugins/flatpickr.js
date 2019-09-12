import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


var today = new Date();

flatpickr("#range_start", {
   altInput: true,
   minDate: today,
   plugins: [new rangePlugin({ input: "#range_end"})]
 })

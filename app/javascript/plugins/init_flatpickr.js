import flatpickr from "flatpickr";

export const init_flatpickr = () => {
const dueDateInput = document.getElementById('list_due_date');

// Check that the query selector id matches the one you put around your form.
if (dueDateInput) {
flatpickr(dueDateInput, {
  minDate: "today",
  dateFormat: "Y-m-d",
    });
  };
};

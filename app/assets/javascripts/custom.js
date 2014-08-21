var ready = function() {
  $('#school_year_start_date').datepicker({ dateFormat: "yy-mm-dd" });
  $('#school_year_end_date').datepicker({ dateFormat: "yy-mm-dd" });
  $('#school_term_start_date').datepicker({ dateFormat: "yy-mm-dd" });
  $('#school_term_end_date').datepicker({ dateFormat: "yy-mm-dd" });
};

$(document).ready(ready);
$(document).on('page:load', ready);

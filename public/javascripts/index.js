$('#document').change(function(event) {
  $(this).closest('.row').find('.btn.submit-btn').removeClass('disabled').removeAttr('disabled');
});
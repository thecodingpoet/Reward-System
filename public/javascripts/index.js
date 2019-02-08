
$('#document').change(function(ev) {
  $(this).closest('.row').find('.btn.submit-btn').removeClass('disabled').removeAttr('disabled');
});
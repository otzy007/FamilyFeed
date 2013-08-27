function getLocation()
{
  if (navigator.geolocation && document.getElementById('feed_checkin').checked)
    {
    navigator.geolocation.getCurrentPosition(showPosition);
    }
  else {jQuery('#feed_longitude').val("Geolocation is not supported by this browser.");}
}
  
function showPosition(position)
{
  jQuery('#feed_latitude').val(position.coords.latitude);
  jQuery('#feed_longitude').val(position.coords.longitude);	
}

jQuery(document).ready(function() {
    jQuery('#feed_post').keydown(function(event) {
        if (event.keyCode == 13) {
            this.form.submit();
            return false;
         }
    });
});

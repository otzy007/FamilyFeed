var x=document.getElementById("alert");

function getLocation()
{
  if (navigator.geolocation && document.getElementById('feed_checkin').checked)
    {
    navigator.geolocation.getCurrentPosition(showPosition);
    }
  else {x.innerHTML="Geolocation is not supported by this browser.";}
}
  
function showPosition(position)
{
  x.innerHTML="Latitude: " + position.coords.latitude + 
  "<br>Longitude: " + position.coords.longitude;	
}
  

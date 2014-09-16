function submit_comment(event, post) {
   if (event.keyCode == 13) {
      jQuery('#new-c' + post + ' > form').submit();
      return false;
   }
}
// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function proj_change_selected(index)
{
  $("#content_nav li a").attr("id", "");
  $("#content_nav li a:eq(" + index + ")").attr("id", "selected");
}
  

function datepicker()
{
  $(".date_picker").attr("readonly", "readonly")

  $(".date_picker").datepicker(
  {
    dateFormat: 'yy-mm-dd',
    changeMonth: true,
    changeYear: true,
    yearRange: '1975:2005'
  }); 
}


function check_roles()
{
  if($("#user_admin").is(":checked"))
      $(".form_role").slideUp();
  else
      $(".form_role").slideDown();

}

function error_dialog(msg, error_title)
{
  $("body").append("<div id=\"dialog-message\"></div>");
  $dialog = $("#dialog-message");
  $dialog.html(msg);
  $dialog.dialog({
      title: error_title,
			modal: true,
			show: 'fade',
			hide: 'fade',
			buttons: {
				Ok: function() {
					$( this ).dialog( "close" );
					$(this).remove();
				}
			}
		});
}


$(function()
{
  
  $("#project-options-list").change(function()
  {
    loc = $(this).val();
    if (loc != null)
      window.location = loc;
  });

  $("#radio-set").buttonset();
  
  //////////// Forms
  
  $("#user_admin").change(function()
  {
    check_roles();
  });

  /////////// Ripped from Articulos
  
 /* $commentFormBody = $("#comment-form-body");
  if($commentFormBody.val() == "")
    $commentFormBody.val("Write your comment here...");
  
  
  $commentFormBody.focus(function()
  {
    if($(this).val() == "Write your comment here...")
      $(this).val(null);
  }).blur(function()
  {
    if($(this).val().trim() == "")
      $(this).val("Write your comment here...");
  });
  
  $("#comment_new").submit(function()
  {
    $textarea = $(this).find("textarea");
    if($textarea.val() == "Write your comment here...")
      $textarea.val() = "";
      
    return true;
    
  });*/

  $("#whoami span").click(function()
  {
    $content = $("#whoami-content");
    visible = $content.is(":visible");
    if(visible == true)
    {
      $content.slideUp();
      $(this).html("&raquo; whoami?");
    }
    else
    {
      $content.slideDown();
      $(this).html("&laquo; hideme");
    }
  });

  check_roles();  
  
  ///////// Initialize datepicker

  datepicker(); 

});

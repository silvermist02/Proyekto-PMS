// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function nav_change_selected(index)
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

function remove_date()
{
	document.getElementById("date").value = "";
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

function render_ajax(title, content)
{
  $("#title").html(title);
  $(".page_content").html(content).hide().fadeIn();
}

function log_slider(default_val)
{
  arr = default_val.split('hour/s');

  $("#slider-range-min").slider({
		range: "min",
		value: parseInt(arr[0]),
		min: 0,
		max: 720,
		slide: function( event, ui ) {
			$("#ticket_logged_time").val( ui.value + "hour/s");
		}
	});
//	$("#ticket_logged_time").val( $("#slider-range-min").slider("value") + "hour/s");
}


$(function()
{
  
  $("#content_nav li a").live("ajax:complete", function(){
       alert("WORKKKKK!");
       $("#loading").show();
    });

  $("#content_nav li a")
      .bind('ajax:beforeSend', function() {alert("loading!");})
      .bind('ajax:success', function(data, status, xhr) {alert("success!");})
      .bind('ajax:failure', function(xhr, status, error) {alert("failure!");})
      .bind('ajax:complete', function() {alert("complete!");});



  
  $("#project-options-list").change(function()
  {
    loc = $(this).val();
    if (loc != null)
      window.location = loc;
  });

  //$("#radio-set").buttonset();
  
  $assignTicket = $("#assign_ticket_form");
  
  $logTime = $("#log_time_form")
  
  $assignTicket .hide();
  
  $logTime .hide();
  
  
 $("#assign_ticket_button").click(function()
 {
    $assignTicket.slideToggle();
   // if(($assignTicket).is(":visible"))
   //   $assignTicket.addClass("slide_selected");
    //else
    //  $assignTicket.removeClass("slide_selected");
 });
 
 $("#log_time_button").click(function()
 {
    $logTime.slideToggle();
   // if(($logTime).is(":visible"))
    // $logTime.addClass("slide_selected");
    //else
     // $assignTicket.removeClass("slide_selected");
 });
  
  
  
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

  if($("#unauthorized").html().trim() != "")
  {
    msg = $("#unauthorized").html();
    error_dialog(msg, "Unauthorized Access");
  }
  
  

  check_roles();  
  
  ///////// Initialize datepicker

  datepicker(); 

});

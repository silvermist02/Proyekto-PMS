// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function proj_change_selected(index)
  {
    $("#proj_nav li a").attr("id", "");
    $("#proj_nav li a:eq(" + index + ")").attr("id", "selected");
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
    if($(this).is(":checked"))
        $(".form_role").slideUp();
    else
        $(".form_role").slideDown();
  });

  datepicker(); 

});

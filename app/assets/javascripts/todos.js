$(document).ready(function(){
  initSumoSelect('#todo_developer_id', 'Select Developer') 
  if($('#todo_form').length > 0){
    $.ajax(
      {
        type: "GET",
        url: '/fetch_developers',
        data: {
          project_id: $('#todo_project_id').val()
        }
    }).done(function(results)
      { 
        setSumoSelectList(results, "todo_developer_id", gon.selected_developer)
    });
  }
})

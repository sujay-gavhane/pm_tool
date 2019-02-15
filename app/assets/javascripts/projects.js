$(document).ready(function(){
   initSumoSelect('#project_developer_ids', 'Select Developers') 
   initSumoSelect('#todo_developer_id', 'Select Developer') 
  if($('#project_form').length > 0){
    $.ajax(
      {
        type: "GET",
        url: '/fetch_developers'
    }).done(function(results)
      { 
        setSumoSelectList(results, "project_developer_ids", gon.selected_developers) //Update supervisor select list
    });
  }
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
        setSumoSelectList(results, "todo_developer_id", gon.selected_developer) //Update supervisor select list
    });
  }
})

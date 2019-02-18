function initSumoSelect(element, placeholder) {
  $(element).SumoSelect({
    search: true,
    selectAll: true,
    searchText: placeholder,
    placeholder: placeholder,
    csvDispCount: 0,
    showTitle: true,
    okCancelInMulti: true,
    isClickAwayOk: true,
    triggerChangeCombined: true
  });
}

function setSumoSelectList(data, listId, selected_obj){
  var list = $('#'+listId);
  if (list.length == 0) return; 
  var sumoSelectObj = list[0].sumo;
  if(sumoSelectObj){
    for(var i=$("#"+listId+" > option").length; i>=1; i--) sumoSelectObj.remove(i-1); //remove all previously populated items if any
    $.each(data, function(k, v) {
      sumoSelectObj.add(v["id"], v["name"] || v["first_name"] + ' ' + v["last_name"]);
    });
    if(selected_obj && selected_obj.length != 0){
      $.each(selected_obj, function(i, v){
        sumoSelectObj.selectItem(v.toString());
      });
    }
    sumoSelectObj.reload()
  }
  list.trigger("change");
}

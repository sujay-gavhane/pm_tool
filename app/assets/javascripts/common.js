$(document).ready(function(){
   initSumoSelect('#project_developer_ids', 'Select Developers') 
})
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

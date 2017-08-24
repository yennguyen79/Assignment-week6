var options = {
	url: function(name) {
		return "/users/search?q=" + name + "&format=json";
	},

	getValue: "name"
};
$ (document).ready(function(){
  $("#provider-remote").easyAutocomplete(options);
  
});

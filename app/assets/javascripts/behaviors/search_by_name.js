SteroidMan.SearchByName = Essential.Behavior.extend({
  events: {
    "keyup input": "performSearch"
  },

  performSearch: function(event) {
    var searchQuery = this.value;

    SteroidMan.xhr({
      url: "/search?name=" + searchQuery,
      success: function(data) {
        document.getElementById("main-container").innerHTML = data.response;
      },
      error: function(data) {
        console.log(data);
      }
    });
  }
});

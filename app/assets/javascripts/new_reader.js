window.NR = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
    var $rootEl = $("#content");
    //get collection
    //TODO: make this local later!!
    feeds = new NR.Collections.Feeds;
    feeds.fetch(
      {success: function(collection){
        //new router instance
        var newsRouter = new NR.Routers.NewsRouter({
          $rootEl: $rootEl,
          collection: collection
        });
        //start history
        Backbone.history.start();
      },
    });
  }
};

$(document).ready(function(){
  NR.initialize();
});

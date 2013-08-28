NR.Routers.NewsRouter = Backbone.Router.extend({

  initialize: function(options){
    this.$rootEl = options.$rootEl;
    this.collection = options.collection;
  },

  routes: {
    "": "index",
    "feeds/:id": "show",
    "feeds/:feed_id/entries/:entry_id": "showEntry",
  },

  index: function(){
    // render view for index and append to the rootEl
    var indexView = new NR.Views.FeedsIndexView({collection: this.collection});
    this.$rootEl.html(indexView.render().$el);
  },

  show: function(id){
    var theModel = this.collection.get(id);
    var that = this;
    theModel.fetch(
      {success: function(model){
        var showView = new NR.Views.FeedShowView({model: model});
        that.$rootEl.html(showView.render().$el);
      }
      });
  },

  showEntry: function(feedID, entryID){
    var theModel = this.collection.get(feedID).get("entries").get(entryID);
    console.log(theModel);
    var showView = new NR.Views.EntryShowView({ model: theModel });
    this.$rootEl.html(showView.render().$el);
  },
});
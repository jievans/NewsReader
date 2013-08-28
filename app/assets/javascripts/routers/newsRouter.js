NR.Routers.NewsRouter = Backbone.Router.extend({

  initialize: function(options){
    this.$rootEl = options.$rootEl;
    this.collection = options.collection;
  },

  routes: {
    "": "index",
    "feeds/:id": "show"
  },

  index: function(){
    // render view for index and append to the rootEl
    var indexView = new NR.Views.FeedsIndexView({collection: this.collection});
    this.$rootEl.html(indexView.render().$el);
  },

  show: function(id){
    var theModel = this.collection.get(id);
    var showView = new NR.Views.FeedShowView({model: theModel});
    this.$rootEl.html(showView.render().$el);
  }
});
NR.Views.FeedShowView = Backbone.View.extend({
  events: {
    "click button": "refresh"
  },
  render: function() {
    var renderedContent = JST["feeds/show"]({feed: this.model});
    this.$el.html(renderedContent);
    return this;
  },
  refresh: function(event) {
    var that = this;
    this.model.fetch({success:
      function(model){
        // Backbone.history.navigate("/#/feeds/:id", {trigger: true})
        that.render();
      }
    });

  },
});
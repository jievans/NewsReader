NR.Views.FeedShowView = Backbone.View.extend({
  render: function() {
    var renderedContent = JST["feeds/show"]({feed: this.model});
    this.$el.html(renderedContent);
    return this;
  }
});
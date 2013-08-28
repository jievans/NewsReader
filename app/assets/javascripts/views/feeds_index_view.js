NR.Views.FeedsIndexView = Backbone.View.extend({

  render: function(){
    var renderedContent = JST["feeds/index"]({feeds: this.collection});
    this.$el.html(renderedContent);
    return this;
  },
});


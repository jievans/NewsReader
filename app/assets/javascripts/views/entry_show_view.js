NR.Views.EntryShowView = Backbone.View.extend({
  render: function() {
    var renderedContent = JST["entries/show"]({ entry: this.model });
    this.$el.html(renderedContent);
    return this;
  }
});
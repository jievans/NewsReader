NR.Models.Feed = Backbone.Model.extend({
  parse: function(data){
    data.entries = new NR.Collections.Entries(data.entries);
    return data;
  },

  toJSON: function(){
    var json = Backbone.Model.prototype.toJSON.call(this);
    json.entries = this.get("entries").toJSON();
    return json;
  },
});
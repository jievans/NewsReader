# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do
  feeds = Feed.create([
    {title: 'cnn-world', url: 'http://rss.cnn.com/rss/cnn_world.rss'},
    {title: 'cnn-tech', url: 'http://rss.cnn.com/rss/cnn_tech.rss'}
  ])
end
collection @feeds
attributes :id, :title, :url
node(:favorite) { @curr_user_favorite }
child(:entries) do
  attributes :id, :title, :published_at, :link
end

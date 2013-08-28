object @feed
attributes :id, :title, :url
child(:entries) do
  attributes :id, :title, :published_at, :link
end
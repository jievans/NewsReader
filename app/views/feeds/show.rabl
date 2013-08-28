model @feed
attributes :id, :title, :url
child(:entries) do
  attribute :id, :title, :published_at
end
json.array!(@photos) do |photo|
  json.extract! photo, :id, :album_id, :title, :url, :trumbnail_url
  json.url photo_url(photo, format: :json)
end

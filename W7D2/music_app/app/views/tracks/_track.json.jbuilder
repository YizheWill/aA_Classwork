json.extract! track, :id, :name, :album_id, :ord, :standard, :lyrics, :created_at, :updated_at
json.url track_url(track, format: :json)

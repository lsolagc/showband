json.extract! music, :id, :title, :artist, :available, :created_at, :updated_at
json.url music_url(music, format: :json)

json.extract! request, :id, :requester, :music_id, :show_id, :created_at, :updated_at
json.url request_url(request, format: :json)

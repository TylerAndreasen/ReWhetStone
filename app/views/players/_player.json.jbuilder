json.extract! player, :id, :username, :display_name, :use_display_name, :created_at, :updated_at
json.url player_url(player, format: :json)

json.array!(@commands) do |command|
  json.extract! command, :id, :command, :type
  json.url command_url(command, format: :json)
end

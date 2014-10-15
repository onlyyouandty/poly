json.array!(@interactions) do |interaction|
  json.extract! interaction, :id, :description, :interaction_id, :interaction_type
  json.url interaction_url(interaction, format: :json)
end

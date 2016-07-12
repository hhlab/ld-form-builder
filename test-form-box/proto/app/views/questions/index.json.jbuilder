json.array!(@questions) do |question|
  json.extract! question, :id, :qtype
  json.url question_url(question, format: :json)
end

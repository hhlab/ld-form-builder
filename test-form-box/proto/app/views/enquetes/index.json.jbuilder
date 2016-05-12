json.array!(@enquetes) do |enquete|
  json.extract! enquete, :id, :title
  json.url enquete_url(enquete, format: :json)
end

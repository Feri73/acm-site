json.array!(@magazines) do |magazine|
  json.extract! magazine, :id, :volume, :title, :published_date, :content, :attachment
  json.url magazine_url(magazine, format: :json)
end

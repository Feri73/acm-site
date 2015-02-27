json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :last, :birthday, :gender
  json.url profile_url(profile, format: :json)
end

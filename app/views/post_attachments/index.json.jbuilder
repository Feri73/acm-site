json.array!(@post_attachments) do |post_attachment|
  json.extract! post_attachment, :id, :title, :comment, :attachment
  json.url post_attachment_url(post_attachment, format: :json)
end

json.array!(@mail_messages) do |mail_message|
  json.extract! mail_message, :id, :body, :subject
  json.url mail_message_url(mail_message, format: :json)
end

class MailMessage < ActiveRecord::Base
  after_create :send_mails

  has_many :user_mail_messages
  has_many :users, :through => :user_mail_messages

  private

  def send_mails
    self.OtherMails.split(";").each do |e|
      UserMailer.send_custom_mail(self.body, self.subject, e).deliver
    end
  end
  handle_asynchronously :send_mails

end

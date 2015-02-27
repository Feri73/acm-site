class UserMailer < ActionMailer::Base
  # class variable to hold logo
  @@acm = File.read(Rails.root.join('app', 'assets', 'images', 'logo.png'))

  # setting default from
  default from: "ACM Student Chapter"

  # call this method to send an email
  def welcome(user)
    recipient = user.email
    subject =
        'به شاخه‌ی دانشجویی ای‌سی‌ام دانشگاه تهران خوش آمدید'
    attachments.inline['acm.png'] = @@acm

    puts 'Email: to => ' + recipient + ', subject => ' + subject
    mail(to: recipient, subject: subject) do |format|
      format.html { render 'welcome_message' }
#      format.html { render 'welcome_message' }
    end
  end

  def send_custom_mail(body, subj, email)
    recipient = email
    subject = subj
    attachments.inline['acm.png'] = @@acm
    mail( to: recipient, subject: subject) do |format|
      format.html { render 'template_message', :locals => {:body => body} }
    end
  end


end

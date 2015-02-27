class UserMailMessage < ActiveRecord::Base


  belongs_to :user
  belongs_to :mail_message



end

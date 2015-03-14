class User < ActiveRecord::Base
  rolify
  include Authority::UserAbilities



  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  #after_create :send_welcome

  has_many :user_mail_messages
  has_many :mail_messages, :through => :user_mail_messages
  has_one :profile

  def active_for_authentication?
      super && self.is_admin?
  end


  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(email: data["email"],
                         password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
  private
  def send_welcome
    UserMailer.welcome(self).deliver
    puts "welcome message send"
  end
  handle_asynchronously :send_welcome

end

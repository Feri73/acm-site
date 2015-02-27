class Group < ActiveRecord::Base
  include Authority::Abilities
  resourcify

  mount_uploader :avatar, AvatarUploader
end

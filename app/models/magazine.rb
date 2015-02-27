class Magazine < ActiveRecord::Base
  include Authority::Abilities
  resourcify

  mount_uploader :attachment, AttachmentUploader
  mount_uploader :avatar, AvatarUploader
end

class PostAttachment < ActiveRecord::Base
  include Authority::Abilities
  resourcify

  mount_uploader :attachment, AttachmentUploader
end

class ItSkill < ActiveRecord::Base
  belongs_to :user
  #alidates :user_id, presence: true
   #mount_uploader :Skilllogo, SkilllogoUploader
end

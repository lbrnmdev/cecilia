class UserProfile < ApplicationRecord
  belongs_to :user
  belongs_to :current_workspace, class_name: "Workspace", optional: true

  # validations
  # validates :user, presence:true # Rails 5 defaults to validating presence of fk for a belongs_to, so presence validation not required
end

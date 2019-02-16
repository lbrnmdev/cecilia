class UserProfile < ApplicationRecord
  belongs_to :user

  # validations
  # validates :user, presence:true # Rails 5 defaults to validating presence of fk for a belongs_to, so presence validation not required
end

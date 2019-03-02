class Workspace < ApplicationRecord
  has_secure_token :sign_up_code
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :current_user_profiles, class_name: "UserProfile", foreign_key: "current_workspace_id", dependent: :nullify

  validates :name, presence: true
end

class Workspace < ApplicationRecord
  has_secure_token :sign_up_code
  has_many :memberships, dependent: :destroy # TODO: maybe add before/after_destroy sending message to users saying workspace deleted
  has_many :users, :through => :memberships
  has_many :current_user_profiles, class_name: "UserProfile", foreign_key: "current_workspace_id", dependent: :nullify
  has_many :wallets, dependent: :nullify

  validates :name, presence: true
end

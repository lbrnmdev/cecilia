class Workspace < ApplicationRecord
  has_secure_token :sign_up_code
  has_many :memberships
  has_many :workspaces, :through => :memberships

  validates :name, presence: true
end

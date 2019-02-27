class Workspace < ApplicationRecord
  has_secure_token :sign_up_code
  has_many :memberships
  has_many :users, :through => :memberships

  validates :name, presence: true
end

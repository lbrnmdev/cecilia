class Membership < ApplicationRecord
  belongs_to :workspace
  belongs_to :user

  validates_presence_of :workspace, :user
  validates_uniqueness_of :workspace_id, :scope => :user_id
end

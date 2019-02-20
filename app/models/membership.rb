class Membership < ApplicationRecord
  belongs_to :workspace
  belongs_to :user

  # validates_presence_of :workspace, :user # TODO: might not need as rails 5 defaults to validating presence of foreign key...
  validates_uniqueness_of :workspace_id, :scope => :user_id
end

class Membership < ApplicationRecord
  belongs_to :workspace, inverse_of: :memberships
  belongs_to :user, inverse_of: :memberships

  # validates_presence_of :workspace, :user # TODO: might not need as rails 5 defaults to validating presence of foreign key...
  validates_uniqueness_of :workspace_id, :scope => :user_id
end

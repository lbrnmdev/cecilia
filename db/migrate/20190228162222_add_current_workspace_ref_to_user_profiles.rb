class AddCurrentWorkspaceRefToUserProfiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_profiles, :current_workspace, foreign_key: {to_table: :workspaces, on_delete: :nullify}
  end
end

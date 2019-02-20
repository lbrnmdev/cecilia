class AddDescriptionToWorkspaces < ActiveRecord::Migration[5.2]
  def change
    add_column :workspaces, :description, :string
  end
end

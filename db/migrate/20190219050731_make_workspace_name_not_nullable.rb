class MakeWorkspaceNameNotNullable < ActiveRecord::Migration[5.2]
  def change
    change_column_null :workspaces, :name, false
  end
end

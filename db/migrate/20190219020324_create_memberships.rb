class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.references :workspace, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.boolean :workspace_creator, null: false, default: false
      t.boolean :workspace_admin, null: false, default: false

      t.timestamps
    end
    add_index :memberships, :workspace_admin
    add_index :memberships, [:workspace_id, :user_id], unique: true
  end
end

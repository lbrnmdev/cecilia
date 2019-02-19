class CreateWorkspaces < ActiveRecord::Migration[5.2]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.string :sign_up_code

      t.timestamps
    end
    add_index :workspaces, :sign_up_code, unique: true
  end
end

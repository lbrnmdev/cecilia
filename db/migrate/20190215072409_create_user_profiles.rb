class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.references :user, index: {:unique=>true}, foreign_key: true, null: false

      t.timestamps
    end
  end
end

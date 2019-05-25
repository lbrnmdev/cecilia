class CreateDisbursements < ActiveRecord::Migration[5.2]
  def change
    create_table :disbursements do |t|
      t.string :description
      t.string :status, null: false, default:"not yet processed"
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end

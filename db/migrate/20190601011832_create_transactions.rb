class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :beneficiary_name
      t.string :msisdn, null: false
      t.references :disbursement, foreign_key: true
      t.integer :no_of_attempts, null: false, default:0
      t.string :status, null:false, default:"not yet attempted"
      t.decimal :amount, precision:9, scale:2

      t.timestamps
    end
  end
end

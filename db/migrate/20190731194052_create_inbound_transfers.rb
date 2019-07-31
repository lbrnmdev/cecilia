class CreateInboundTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :inbound_transfers do |t|
      t.references :wallet, foreign_key: true
      t.decimal :amount, precision:9, scale:2, null: false
      t.string :description

      t.timestamps
    end
  end
end

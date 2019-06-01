class Disbursement < ApplicationRecord
  belongs_to :wallet

  has_many :transactions, dependent: :nullify
end

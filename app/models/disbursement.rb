class Disbursement < ApplicationRecord
  belongs_to :wallet

  has_many :transfers, dependent: :nullify
end

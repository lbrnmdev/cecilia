class InboundTransfer < ApplicationRecord
  belongs_to :wallet

  validates :amount, presence: true, numericality: {greater_than: 0}
end

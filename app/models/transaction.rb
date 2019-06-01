class Transaction < ApplicationRecord
  belongs_to :disbursement

  validates :msisdn, presence: true
  validates :no_of_attempts, numericality: {greater_than_or_equal_to: 0}
  validates :status, presence: true
end

class Transfer < ApplicationRecord
  belongs_to :disbursement

  validates :msisdn, presence: true
  validates :no_of_attempts, numericality: {greater_than_or_equal_to: 0}
  validates :status, presence: true

  # compute transaction fee (at 0.5%) # TODO: should be set somewhere else
  def fee
    (amount * 0.005) if amount
  end

  # compute transaction total
  def total
    (amount + fee) if amount
  end
end

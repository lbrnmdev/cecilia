class Wallet < ApplicationRecord
  belongs_to :workspace
  has_many :disbursements, -> {order(created_at: :desc)}, dependent: :nullify
  has_many :inbound_transfers, dependent: :nullify # TODO: test nullify on delete

  # Balance calculation
  # The following methods for balance calculation are naive with regards to
  # performance/efficiency as entire wallet.transaction table is summed up every
  # time

  # TODO: implement method to calculate actual balance
  # sum up wallet's successful transfers
  def actual_balance
    # sum inbound
    # sum successful outbound
    # return inbound - outbound # FIXME: replace outbound transfer sum with more efficient query, change to sum transfer totals directly
    inbound_transfers.sum(:amount) - Transfer.where(disbursement: disbursements, status:'successful').sum(:amount) * 1.005
  end

  # TODO: implement method to calculate available balance
  # sum up wallet's successful and pending disbursements
  def available_balance
    # sum inbound
    # sum successful and pending disbursements(FIXME: for now these are failed transfers, transfers should set to archived so as not to be considered as pending)
    # return difference
    inbound_transfers.sum(:amount) - Transfer.where(disbursement: disbursements, status:['successful', 'failed']).sum(:amount) * 1.005
  end
end

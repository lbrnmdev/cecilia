class Wallet < ApplicationRecord
  belongs_to :workspace
  has_many :disbursements, -> {order(created_at: :desc)}, dependent: :nullify
end

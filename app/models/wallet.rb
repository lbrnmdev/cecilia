class Wallet < ApplicationRecord
  belongs_to :workspace
  has_many :disbursements, dependent: :nullify
end

class ProcessDisbursementWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  require 'api_caller'

  def perform(disbursement_id)
    Disbursement.find(disbursement_id).transfers.each do |transfer|
      # TODO: make this transactional, so if something fails the transaction is reversed
      # TODO: refactor to not even have to look at transfer's status if already successful/archived
      unless ["successful", "archived"].include? transfer.status
        transfer.update(status: ApiCaller::Telco.process_transfer(transfer.msisdn))
      end
      # TODO: actioncable broadcast to disbursement channel
    end
  end
end

class ProcessDisbursementWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  require 'api_caller'

  def perform(disbursement_id)
    # send signal to activate loader on view
    ActionCable.server.broadcast 'process_disbursement_channel', make_loader_active:'true'

    # iterate through and make call to api for each transaction
    Disbursement.find(disbursement_id).transfers.each do |transfer|
      # TODO: make this transactional, so if something fails the transaction is reversed
      # TODO: refactor to not even have to look at transfer's status if already successful/archived
      unless ["successful", "archived"].include? transfer.status
        # t_updated = transfer.update(status: ApiCaller::Telco.process_transfer(transfer.msisdn))
        if transfer.update(status: ApiCaller::Telco.process_transfer(transfer.msisdn))
          # generate row id using transfer id and msisdn as input, same should be done in view
          # so that we can match broadcast to appropriate transfer
          # TODO: figure out how expensive Digest::UUID methods are, perhaps find alternative
          # broadcast status if update works
          # Digest::UUID.uuid_v3(t_updated.msisdn, t_updated.id.to_s)

          # scrap above procedure and use transfer_id as identifier for now
          ActionCable.server.broadcast 'process_disbursement_channel',
                                        status_cell_id: "#status_cell_#{transfer.id}",
                                        status: transfer.status
        end
      end
      # TODO: actioncable broadcast to disbursement channel
    end

    # send signal to deactivate loader on view
    ActionCable.server.broadcast 'process_disbursement_channel', make_loader_active:'false'
  end
end

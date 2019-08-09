class ProcessDisbursementChannel < ApplicationCable::Channel
  def subscribed
    stream_from "process_disbursement_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

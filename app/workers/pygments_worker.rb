class PygmentsWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  # sidekiq_options retry: false

  def perform(message)
    p message
    arr = message.split()
    if arr[1]!="-" 
      rtx.send_notify(message)
    end
  end
end



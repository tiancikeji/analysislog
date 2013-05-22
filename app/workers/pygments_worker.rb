class PygmentsWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  # sidekiq_options retry: false

  def perform(message)
    p message
    arr = message.split(" ")
    if arr[0]!="-" and arr[2].startswith("TCP_MISS") and arr[1]>1000 and arr[3]/arr[0]<40 and arr[3]>40
      Rtx.send_notify(message)
    end
  end
end



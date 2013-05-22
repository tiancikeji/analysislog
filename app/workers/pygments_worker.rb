class PygmentsWorker
  include Sidekiq::Worker
  # sidekiq_options queue: "high"
  # sidekiq_options retry: false

  def perform(message)
    p message
    arr = message.to_s.split(" ")
    if arr[0]!="-" and arr[3].match("TCP_MISS") and arr[1] > 1000 and arr[4]/arr[1] < 40 and arr[4] > 40
      Rtx.send_notify(message.to_s)
    end
  end
end



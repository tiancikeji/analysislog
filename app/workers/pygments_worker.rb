class PygmentsWorker
  include Sidekiq::Worker
  # sidekiq_options queue: "high"
  # sidekiq_options retry: false

  def perform(message)
    p message
    # arr = message.split(" ")
    # if arr[0]!="-" and arr[2].match("TCP_MISS") and arr[1] > 1000 and arr[3]/arr[0]<40 and arr[3]>40
    # if arr[3].match("TCP_MISS")
    Rtx.send_notify(message.to_s)
    # end
  end
end



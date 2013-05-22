#encoding: utf-8
class Rtx
  def self.send_notify(msg)
    receiver = "王雷"
    Rails.logger.info "/sendnotify.cgi?msg="+URI::escape(msg.encode(Encoding.find("GBK"),Encoding.find("UTF-8")))+"&receiver="+URI::escape(receiver.encode(Encoding.find("GBK"),Encoding.find("UTF-8")))
    Net::HTTP.start("rtx.chinacache.com", 8012) do |http|
      http.get("/sendnotify.cgi?msg="+URI::escape(msg.encode(Encoding.find("GBK"),Encoding.find("UTF-8")))+"&receiver="+URI::escape(receiver.encode(Encoding.find("GBK"),Encoding.find("UTF-8"))))
    end
  end
end

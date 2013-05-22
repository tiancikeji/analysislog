#encoding: utf-8
class Rtx
  def self.send_notify(message)
    url = URI.encode("http://rtx.chinacache.com:8012/sendnotify.cgi?msg="+message+"&receiver=王雷")
    response = HTTParty.get(url)
    p response
  end
end

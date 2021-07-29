require 'net/http'
require 'json'

class IFConfig
  def self.myip
    output = JSON.parse(Net::HTTP.get('lumtest.com', '/myip.json'))
    return output["ip"]
  end
end


puts IFConfig.myip

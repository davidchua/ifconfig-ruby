require 'net/http'
require 'json'

retries = 0

class IFConfig
  def self.myip
    begin
    output = JSON.parse(Net::HTTP.get('lumtest.com', '/myip.json'))
    rescue
      if (retries += 1) <= 4
        sleep(1)
        retry
      else
        raise
      end
    end
    return output["ip"]
  end
end

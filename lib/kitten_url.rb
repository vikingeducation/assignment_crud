require 'httparty'

module KittenUrl

  def self.get_image
    
    xml = HTTParty.get("http://thecatapi.com/api/images/get?format=xml&size=small&results_per_page=1")
    xml["response"]["data"]["images"]["image"]["url"]

  end

end
require 'httparty'

module KittenUrl
  
  def self.get_image
    
    xml = HTTParty.get("http://thecatapi.com/api/images/get?format=xml&size=small&results_per_page=1")
    image_url = xml["response"]["data"]["images"]["image"]["url"]
    unless image_url.nil?
      image_url
    else
      "http://26.media.tumblr.com/tumblr_lu22qhia571qdvbl3o1_250.jpg"
    end

  end
  
end
require 'httparty'

module KittenUrl

  include HTTParty


  def get_kitten_image
    
    response = self.class.get("http://thecatapi.com/api/images/get?format=xml&size=small&results_per_page=1")
    response["response"]["data"]["images"]["image"]["url"]

  end

end
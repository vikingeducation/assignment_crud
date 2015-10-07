require 'kitten_url'

class Kitten < ActiveRecord::Base

  before_create :get_image

  private

  def get_image
    self.picture = KittenUrl::get_image
  end

end

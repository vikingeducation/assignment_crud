require 'uri'

class Robot < ActiveRecord::Base
	END_POINT = 'http://robohash.org/'

	def image
		"#{END_POINT}/#{URI::encode(name)}"
	end
end

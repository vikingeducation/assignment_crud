class Notice < ActiveRecord::Base
  validates :title, presence: true
end

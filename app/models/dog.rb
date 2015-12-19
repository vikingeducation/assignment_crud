class Dog < ActiveRecord::Base
  validates :name, :breed, :age, presence: true
end

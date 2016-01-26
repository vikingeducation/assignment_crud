class User < ActiveRecord::Base
  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :email,       presence: true,
                          uniqueness: true,
                          format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
end

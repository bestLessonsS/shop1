class Customer < ActiveRecord::Base
	has_many :orders

	validates :name, :surname, presence: true
end

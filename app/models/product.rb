class Product < ActiveRecord::Base

	has_many :orderElements

	validates :name, :price, :amountAvailable, presence: true
	validates :price, numericality: {greater_than: 0}
	

end

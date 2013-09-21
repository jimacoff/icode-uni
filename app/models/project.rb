class Project < ActiveRecord::Base

		validates :client , :product_code, :name , :date ,  presence: :true
	validates :name, uniqueness: :true

	belongs_to :client

	has_many :stations
	#has_many :estimations , :through => :stations  << use this when need to see estimation infro trough product


	
end

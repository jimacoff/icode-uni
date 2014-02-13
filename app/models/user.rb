class User < ActiveRecord::Base

  # after_destroy :is_admin?
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :lockable, :timeoutable, :validatable


  has_many :roles, :dependent => :destroy
  has_many :inventory_management_systems, through: :roles
  has_many :project
  has_many :estimations
  
  validates :username, presence: :true, length: {:in => 5..24}, uniqueness: true

# private

#   def is_admin?  
#     # if admin == true
#     if user_id == 1
#       raise "The user cannot be delete!"
#     end
#   end

# def self.hhy
#    user = User.new(:username => "administrator", :email => "administrator@gmail.com", :password => '12345678', 
#    				   :password_confirmation => "12345678" , :status => 1, :admin => 1)
#    user.save!
# end
end

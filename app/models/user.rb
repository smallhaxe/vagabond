class User < ActiveRecord::Base
  
	validates :password, confirmation: true
	validates :email, uniqueness: true

  has_secure_password

  has_many :posts, dependent: :destroy

  def self.confirm(params)
  	@user = User.find_by({email: params[:email]})
  	@user.try(:authenticate, params[:password])
	end
  
end

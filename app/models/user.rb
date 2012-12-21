class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

   attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :campaigns, :foreign_key => 'client_id', :dependent => :destroy
  has_many :projects, :through => :campaigns
end

class Designer < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :assignments, :class_name => 'ProjectAssignment'
  has_many :projects, :through => :assignments
  has_many :creations

  scope :active, :conditions => {active: true}

  def manages?(creation)
    true
  end

  def can_view?(creation)
    true
  end

  def admin?
    true
  end

  def designer?
    true
  end
end

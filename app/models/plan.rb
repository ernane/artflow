class Plan < ActiveRecord::Base
  attr_accessible :description, :name

  validates_uniqueness_of :name
  validates_presence_of :name, :description

  has_many :subscriptions
end

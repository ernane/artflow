class Campaign < ActiveRecord::Base
  belongs_to :client, :class_name => 'User'
  
  attr_accessible :cost, :end_date, :name, :start_date

  validates_presence_of :name
  validates_uniqueness_of :name
end

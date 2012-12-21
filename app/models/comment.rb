class Comment < ActiveRecord::Base
  belongs_to :creation
  belongs_to :user, polymorphic: true
  attr_accessible :body

  validates_presence_of :body
end

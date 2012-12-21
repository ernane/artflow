class Project < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :client

  has_many :creations, :dependent => :destroy
  has_many :assignments, :class_name => 'ProjectAssignment'
  has_many :designers, :through => :assignments

  attr_accessible :name

  validates_presence_of :name, :client_id
  
  before_validation :copy_client_id, on: :create
  
  scope :active, where(active: true)

  def self.total_hours
    all.map(&:total_hours).sum
  end
  
  def total_hours
    creations.sum(:hours)
  end
  
  private

  def copy_client_id
    write_attribute(:client_id, campaign.client_id)
  end
end

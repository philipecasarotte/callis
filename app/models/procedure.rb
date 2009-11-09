class Procedure < ActiveRecord::Base
  belongs_to :user
  belongs_to :department
  
  validates_presence_of :name, :explanation
  validates_uniqueness_of :permalink
  
  acts_as_seo

  has_permalink :name, :update => true
  
  default_scope :order => "position"
end

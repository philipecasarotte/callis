class Procedure < ActiveRecord::Base
  belongs_to :user
  belongs_to :department
  
  validates_presence_of :name, :explanation
  validates_uniqueness_of :permalink
  
  acts_as_seo

  has_permalink :name, :update => true
  
  named_scope :by_date, :order => "created_at DESC"
  named_scope :by_position, :order => "position"
end

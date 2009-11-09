class Department < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :permalink
  
  has_many :users
  has_many :procedures

  has_permalink :name, :update => true  
end

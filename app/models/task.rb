class Task < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :list
  
  validates :list, :name, :presence => true
  
end

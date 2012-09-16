class Task < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :user
  
  belongs_to :list
  
  validates :user, :list, :name, :presence => true
  
end

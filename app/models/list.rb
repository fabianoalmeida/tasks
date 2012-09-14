class List < ActiveRecord::Base
  attr_accessible :name, :limited
  
  belongs_to :user
  
  validates :user, :name, :presence => true
  
  validates_inclusion_of :limited, :in => [true, false]
  
end

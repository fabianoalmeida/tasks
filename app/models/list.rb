class List < ActiveRecord::Base
  attr_accessible :name, :limited
  
  belongs_to :user
  
  has_many :tasks
  
  validates :user, :name, :presence => true
  
  validates_inclusion_of :limited, :in => [true, false]
  
end

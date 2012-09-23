class List < ActiveRecord::Base
  attr_accessible :name, :limited, :tasks_attributes
  
  belongs_to :user
  
  has_many :tasks, :dependent => :destroy
  
  validates :user, :name, :presence => true
  
  validates_inclusion_of :limited, :in => [true, false]
  
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |t| t[:name].blank? }, allow_destroy: true
  
end

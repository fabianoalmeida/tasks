class List < ActiveRecord::Base
  attr_accessible :name, :limited, :tasks_attributes
  
  belongs_to :user
  
  has_many :tasks, :dependent => :destroy
  
  validates :user, :name, :presence => true
  
  validates_inclusion_of :limited, :in => [true, false]
  
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |t| t[:name].blank? }, allow_destroy: true
  
  def self.publics_for(user)
    where{ ( user_id.not_eq my{ user.id } ) & ( limited.eq false ) }
  end
  
end

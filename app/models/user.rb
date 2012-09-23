class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :login, :username
  # attr_accessible :title, :body
  
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  
  validates :first_name, :last_name,
            :presence => true,
            :length => { :within => 2..20 },
            :allow_blank => true
  
  validates :username,
            :presence => true,
            :length => { :within => 5..20 },
            :uniqueness => { :case_sensitive => false },
            :format => /^[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*$/,
            :allow_blank => true
  
  has_many :lists
  
  has_and_belongs_to_many :favorite_lists, 
                          :class_name  => "List",
                          :foreign_key => "user_id",
                          :join_table  => "lists_users", 
                          :uniq        => :true,
                          :before_add  => :before_adding_list
  
  protected
  
  def before_adding_list(list)
    raise "Only must add a list unlimited" if list.limited?
    raise "Only must add a list from other user" if list.user.eql?(self)
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end

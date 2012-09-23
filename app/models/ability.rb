class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :create], List
    can [:update, :destroy], List do |list|
      list.user.id.eql? user.id
    end
    
    can [:read, :create], Task
    can [:update, :destroy], Task do |task|
      task.list.user.id.eql? user.id
    end
  end
end

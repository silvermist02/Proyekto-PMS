class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :read, Comment
      role = Role.find(user.role_id)
        can :add_member, Project  if role.member_add
        can :remove_member, Project  if role.member_remove
        can :create, Project  if role.project_create
        can :read, Project     if role.project_read
        can :update, Project  if role.project_update
        can :destroy, Project  if role.project_delete
        
        can :create, Ticket  if role.ticket_create
        can :read, Ticket  if role.ticket_read
        can :update, Ticket if role.ticket_update
        can :destroy, Ticket  if role.ticket_delete
        can :assign, Ticket  if role.ticket_assign
        
        can [:create, :destroy], Comment  if role.ticket_comment
        
        can :create, Tag  if role.tag_create
        can :read, Tag if role.tag_read
        can :update, Tag  if role.tag_update
        can :destroy, Tag  if role.tag_delete
        
    end
      
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end

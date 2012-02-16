class UserPermit < CanTango::UserPermit
  def initialize ability
    super
  end

  protected

  def permit_rules
    # insert your can, cannot and any other rule statements here
    can :read, Post
    can :write, Post
    # can :manage, [Post]
    # use any licenses here
  end

  module Cached
    def permit_rules
    end
  end

  module NonCached
    def permit_rules
    end
  end
end

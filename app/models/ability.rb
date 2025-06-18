class Ability
  include CanCan::Ability

  def initialize(user)

    if user.admin?
      # Permisos para el administrador
      can :manage, :all
      return
    end

    # Permite a cualquier usuario (incluso no autenticado) ver perfiles
    can :read, Profile
    can :read, User

    # Solo si el usuario está logueado
    return unless user.present?

    # Permisos para su propio perfil y cuenta
    can :manage, User, id: user.id
    can :manage, Profile, user_id: user.id
    can :manage, Post, profile: { user_id: user.id }
    can :create, Post, profile: { user_id: user.id }
    can :create, Comment
    can :manage, Comment, profile: { user_id: user.id }




    # (Agrega más permisos aquí si usas posts, comentarios, etc.)
  end
end

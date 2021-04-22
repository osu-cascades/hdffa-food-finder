module UsersHelper

  def editable_by_user?(user, current_user)
    current_user == user || current_user.admin? || current_user.superadmin?
  end

end

module DashboardHelper

  def current_user_can_edit?
    if is_top_level_admin?
      true
    else
      false
    end
  end
end

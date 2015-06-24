class UserAccessible
  attr_reader :user, :area, :action

  def initialize(user, area, action)
    @user = user
    @area = area
    @action = action
  end

  def can_access?
    check_accessible_area
  end

  private

  def check_accessible_area
    case area
    when :reservation
      check_reservation_accesses
    end
  end

  def check_reservation_accesses
    if action == :view
      true
    elsif action == :reserve
      is_top_level_management? || is_low_level_admin?
    elsif action == :confirm_sale
      is_top_level_management?
    elsif action == :cancel_sale
      is_top_level_management?
    elsif action == :edit_sale
      is_top_level_admin?
    end
  end

  def is_top_level_admin?
    if user && user.company.parent_id.to_i == 0
      user.is_admin?
    else
      return false
    end
  end

  def is_top_level_staff?
    if user && user.company.parent_id.to_i == 0
      user.is_staff?
    else
      return false
    end
  end

  def is_top_level_management?
    is_top_level_admin? || is_top_level_staff?
  end

  def is_low_level_admin?
    if user && user.company.parent_id.to_i > 0
      user.is_admin?
    else
      return false
    end
  end

  def is_low_level_staff?
    if current_user && current_user.company.parent_id.to_i > 0
      current_user.is_staff?
    else
      return false
    end
  end

  def is_low_level_management?
    is_low_level_admin? || is_low_level_staff?
  end


end
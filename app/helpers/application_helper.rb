module ApplicationHelper
  def username
    return 'visitant' if current_user.blank?
    current_user&.name.downcase
  end
end

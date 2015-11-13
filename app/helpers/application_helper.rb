module ApplicationHelper
  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end

  def user_logged_in?
    current_user.present?
  end
end

module ApplicationHelper

  def is_user
    @auth.present?
  end

end

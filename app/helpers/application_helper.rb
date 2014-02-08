module ApplicationHelper

  def full_title(page_title)
    base_title = "Bind"
    if page_title.empty?
      base_title
    elsif page_title == "Home"
      "#{base_title} | Welcome!"
    else
      "#{base_title} | #{page_title}"
    end
  end

  def current_user?(user)
    user == current_user
  end
end

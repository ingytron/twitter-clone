module ApplicationHelper

  # Returns full title for the page
  def full_title(page_title = '')
    # base_title = "Bettwitter the Amazing Twitter Clone"
    base_title = "Betwitter"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

end

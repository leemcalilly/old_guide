module ApplicationHelper
  
  def app_name
    'The Fuzz Guide to Guitar'
  end

  def app_domain
    'fuzzguide.com'
  end
  
  def system_email
    'hello@originalfuzz.com'
  end
  
  def company_name
    'Original Fuzz'
  end
  
  def company_url
    'http://www.originalfuzz.com'
  end
  
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "#{app_name}"
    if page_title.empty?
      base_title
    else
      "#{page_title} < #{base_title}"
    end
  end
  
  def flash_class(level)
    case level
      when :notice then "alert alert-success"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
    end
  end
  
end

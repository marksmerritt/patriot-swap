module ApplicationHelper
  def flash_class(level)
    case level
      when "notice" then "alert-dark"
      when "success" then "alert-success"
      when "error" then "alert-danger"
      when "alert" then "alert-warning"
    end
  end

  def static_google_map(long, lat)
    image_tag(
                "http://maps.googleapis.com/maps/api/staticmap?center=#{lat},#{long}&markers=#{lat},#{long}&zoom=12&size=640x400&key=#{ENV["GOOGLE_KEY"]}",  
                alt: "Location on a map"
              )
  end
end

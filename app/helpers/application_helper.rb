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

  def display_icon(svg_name, style_class = "")
    path = asset_path('sprite.svg') 
    svg_name = svg_name.prepend("#icon-")
    
    content_tag(:svg, class: style_class) do 
      content_tag(:use, nil, 'xlink:href' => path + svg_name)
    end
  end

  def display_avatar(user, style_class = "", size = 40)
    if user.avatar.attached?
      image_tag(user.avatar.variant(resize: "#{size}x#{size}!"), alt: "User avatar", class: style_class)
    else
      gravatar_image_tag("you@example.com", alt: "User avatar", class: style_class, gravatar: { size: size })
    end
  end
end

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

  def display_icon(icon: svg_name, style: "", id: "")
    path = asset_path('sprite.svg') 
    icon = icon.prepend("#icon-")
    
    content_tag(:svg, class: style, id: id) do 
      content_tag(:use, nil, 'xlink:href' => path + icon)
    end
  end

  def display_avatar(user: user, style: "", size: 40)
    if user.avatar.attached?
      image_tag(user.avatar.variant(resize: "#{size}x#{size}!"), alt: "User avatar", class: style)
    else
      gravatar_image_tag("you@example.com", alt: "User avatar", class: style, gravatar: { size: size })
    end
  end
end

module ApplicationHelper
  def static_google_map(long:, lat:, style:)
    image_tag(
                "http://maps.googleapis.com/maps/api/staticmap?center=#{lat},#{long}&markers=#{lat},#{long}&zoom=12&size=640x400&key=#{ENV["GOOGLE_KEY"]}",  
                alt: "Location on a map", class: style
              )
  end

  def display_icon(icon: svg_name, style: "", id: "")
    path = asset_path('sprite.svg') 
    icon = icon.prepend("#icon-")
    
    content_tag(:svg, class: style, id: id) do 
      content_tag(:use, nil, 'xlink:href' => path + icon)
    end
  end

  def display_avatar(user:, style: "", size: 40)
    if user.avatar.attached?
      image_tag(user.avatar.variant(resize: "#{size}x#{size}!").processed, alt: "User avatar", class: style)
    else
      gravatar_image_tag("you@example.com", alt: "User avatar", class: style, gravatar: { size: size })
    end
  end

  def display_feature_image(listing)
    img = if listing.images.attached?
            thumbnail_img(listing.images.first)
          elsif listing.book.image.attached?
            thumbnail_img(listing.book.image)
          else
            nil # TODO: Add placeholder
          end

    image_tag(img, alt: 'Listing image', class: 'listing__img') if img
  end

  def thumbnail_img(img)
    img.variant(combine_options: {thumbnail: '200x150^', gravity: 'center'}).processed
  end

  def full_img(img)
    img.variant(combine_options: {thumbnail: '600x450^', gravity: 'center'}).processed
  end

  def ymd_format(dt)
    dt.strftime("%m-%d-%y")
  end
end

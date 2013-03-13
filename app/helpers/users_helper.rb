module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?d=mm&s=150"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def correct_user?
    @user = User.find(params[:id])

    @user == current_user
  end


  def convert_seconds_to_time(seconds)

     minutes = seconds.to_i / 60
     seconds_left = seconds.to_i % 60

     return "#{minutes}:#{seconds_left}"

  end

  def sport_icon(sport_name)
    if sport_name == "Basketball"
      image_tag "basketball_icon.png", :size => "20x20", :alt => "Basketball icon"
    elsif sport_name == "Football"
      image_tag "football_icon.png", :size => "20x20", :alt => "Football icon"
    end
  end

end

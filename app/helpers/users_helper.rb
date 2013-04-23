module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 150 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=mm&s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end


  def correct_user?
    @user = User.find(params[:id])

    @user == current_user
  end


  def convert_seconds_to_time(seconds)

     minutes = seconds.to_i / 60
     seconds_left = seconds.to_i % 60

     #If there are less than 10 seconds we add a zero, so that it looks like xx:0x instead of xx:x
     if seconds_left < 10
       seconds_left = "#{0}#{seconds_left}"
     end

     "#{minutes}:#{seconds_left}"

  end

  #Returns the appropriate icon given the sport's name
  def sport_icon(sport_name)
    if sport_name == "Basketball"
      image_tag "basketball_icon.png", :size => "20x20", :alt => "Basketball icon"
    elsif sport_name == "Football"
      image_tag "football_icon.png", :size => "20x20", :alt => "Football icon"
    end
  end


  #Returns the age of the user given his birthday
  def calculate_age(birthday)

    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)

  end


end

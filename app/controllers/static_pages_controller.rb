class StaticPagesController < ApplicationController

  def home
    #If user is signed in, we redirect him to his profile page
    if signed_in?
      redirect_to current_user
    end

  end

  def help
  end

  def about
  end

  def contact
  end

end

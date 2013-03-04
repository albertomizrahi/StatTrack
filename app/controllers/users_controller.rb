class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :signed_user_unnecessary_pages, only: [:new, :create]

  def new
    @user = User.new

  end

  def show
    @user = User.find(params[:id])

    #This is the model used to allow the user to add a sport to their account
    @sportization = Sportization.new

    #Retrieves all the sports that the user has already chosen
    @sports_already_chosen = @user.sports

    @basketball_stat = BasketballStat.new
    @football_quarterback_stat = FootballQuarterbackStat.new
    @football_receiver_stat = FootballReceiverStat.new
    @football_runningback_stat = FootballRunningbackStat.new
    @football_defense_stat = FootballDefenseStat.new
    #@basketball_stats_recorded = current_user.basketball_stats

  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.

      #Sign the user in
      sign_in @user
      #Flashes a message welcoming the new user
      flash[:success] = "Welcome to StatHub.me!"
      # Afterwards, it redirects the user to its respective profile page
      redirect_to @user
    else
      #After the new view is rendered, the errors will be displayed in the error_messages partial
      render 'new'
    end
  end


  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      #Signs the user in again because the remember token is updated too when the update_attributes methods is applied
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end


 private

    #After checking that the  user is signed, we check that he is trying to update his own information not of someone else
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    #Some views like new and create should not be viewable for users who are signed in
    def signed_user_unnecessary_pages
      if signed_in?
        redirect_to(root_path)
      end
    end

end

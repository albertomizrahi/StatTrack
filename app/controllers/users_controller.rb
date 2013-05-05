class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:edit, :update, :search]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :signed_user_unnecessary_pages, only: [:new, :create]

  #In order to deal with the situation in which the user adds a sport he has already added
  rescue_from ActiveRecord::RecordNotFound, :with => :user_not_found


  def new
    @user = User.new

  end


  def show
    @user = User.find(params[:id])

    #This is the model used to allow the user to add a sport to their account
    @sportization = Sportization.new

    #Retrieves all the sports that the user has already chosen
    @sports_already_chosen = @user.sports.uniq

    @basketball_stat = BasketballStat.new
    @football_quarterback_stat = FootballQuarterbackStat.new
    @football_receiver_stat = FootballReceiverStat.new
    @football_runningback_stat = FootballRunningbackStat.new
    @football_defense_stat = FootballDefenseStat.new

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

    @user = User.find(params[:id])

    #If the user clicks the profile update button
    if params[:profile_button]

      #Update the  attributes
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated"
        #Signs the user in again because the remember token is updated too when the update_attributes methods is applied
        sign_in @user
        redirect_to @user

      else
        render 'edit'
      end

      #If the user clicks the change password button
    elsif params[:password_button]


      user = User.find_by_email(current_user.email).try(:authenticate, params[:user][:old_password])

      #If old password is correct
      if user
        #Will be changed to false if it fails any of the following validations
        form_is_valid = true

        #If user leaves password blank
        if params[:user][:password].blank?
          @user.errors.add(:password, "can't be blank.")
          form_is_valid = false
        end
        #If user leaves password confirmation blank
        if params[:user][:password_confirmation].blank?
          @user.errors.add(:password_confirmation, "can't be blank.")
          form_is_valid = false
        end

        #If the password and and password confirmation do not match
        if  params[:user][:password] != params[:user][:password_confirmation]
          @user.errors.add(:password, "and password confirmation don't match.")
          form_is_valid = false
        end

        #If the form is valid, we update the password attributes
        if form_is_valid and @user.update_attributes(params[:user])
          flash[:success] = "Profile updated"
          #Signs the user in again because the remember token is updated too when the update_attributes methods is applied
          sign_in @user
          redirect_to @user

        else
          render 'edit'
        end

        #If the user input the wrong password
      else
        sign_in @user
        @user.errors.add(:old_password, "is incorrect.")
        render 'edit'


      end

    end

  end


  def search
    @users = User.search(params[:search])
    #Do not show the current user as part of the search
    @users.delete_if{|user| user == current_user}
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

    def user_not_found
      redirect_to root_url
    end

end

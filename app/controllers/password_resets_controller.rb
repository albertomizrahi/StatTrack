class PasswordResetsController < ApplicationController
  def new
  end



  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url, :notice => "An email has been sent with your password reset instructions."
  end



  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end



  def update
    @user = User.find_by_password_reset_token!(params[:id])

    #Will be changed to false the form input fails any of the following validations
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

    #If more than two hours has passed since the email was sent,
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Your password reset has expired."
    #If validations have passed, update the new password
    elsif form_is_valid and @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your password reset has been successful."
    else
      render 'edit'
    end
  end


end

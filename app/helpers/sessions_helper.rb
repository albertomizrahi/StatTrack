module SessionsHelper

  #Signs the user in by creating a cookie with the remember token of the user
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  #Returns true or false based on if the user is signed in or not
  def signed_in?
    #If current_user is not nil
    !current_user.nil?
  end

  #Used for the before_filter in order to determine if the user is signed in so that he can edit and update his profile
  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  #Defines a method current_user= expressly designed to handle assignment to current_user such as in the sign_in method
  def current_user=(user)
    @current_user = user
  end

  #Returns a boolean value by checking if the kin if the current user matches the user passed in the parameter
  def current_user?(user)
    user == current_user
  end

  #Calls the find_by_remember_token method the first time current_user is called but on subsequent invocations returns @current_user without hitting the database
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token]) if cookies[:remember_token]
  end

  #Signs the user out
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end

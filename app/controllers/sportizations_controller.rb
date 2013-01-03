class SportizationsController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy]
  #In order to deal with the situation in which the user adds a sport he has already added
  rescue_from ActiveRecord::RecordNotUnique, :with => :user_already_added_sport

  def create
    @sportization = current_user.sportizations.build(params[:sportization])

    if @sportization.save
      flash[:success] = "Sport added!"
      redirect_to current_user

    else

      render 'users/show'
    end
  end

  def destroy
    #Deletes the sportization for the given sport and the association between the user and the sport
    Sportization.find(params[:id]).delete

    redirect_to current_user
  end


  private

  def user_already_added_sport
    redirect_to current_user, :flash => { :error => "The sport chosen has already been added" }
  end

end

class SportizationsController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy]
  #In order to deal with the situation in which the user adds a sport he has already added
  rescue_from ActiveRecord::RecordNotUnique, :with => :user_already_added_sport

  def create
    @sportization = current_user.sportizations.build(params[:sportization])

    if @sportization.save
      flash[:success] = "Sport added!"
      redirect_to user_path(current_user.id, tab:Sport.find(@sportization.sport_id).name)

    else

      render 'users/show'
    end
  end

  def destroy

    sportization = Sportization.find(params[:id])

    #We make sure to delete all the stats of the sport deleted
    if Sport.find(sportization.sport_id).name == "Basketball"
      BasketballStat.find_all_by_user_id(sportization.user_id).each(&:delete)
    elsif sportization.position == "Quarterback"
      FootballQuarterbackStat.find_all_by_user_id(sportization.user_id).each(&:delete)
    elsif sportization.position == "Runningback"
      FootballRunningbackStat.find_all_by_user_id(sportization.user_id).each(&:delete)
    elsif sportization.position == "Receiver" or sportization.position == "Tight end"
      FootballReceiverStat.find_all_by_user_id(sportization.user_id).each(&:delete)
    end

    #Deletes the sportization for the given sport and the association between the user and the sport
    sportization.destroy

    redirect_to current_user
  end


  private

  def user_already_added_sport
    redirect_to current_user, :flash => { :error => "The sport chosen has already been added" }
  end

end

class SportizationsController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy, :update]
  #In order to deal with the situation in which the user adds a sport he has already added
  rescue_from ActiveRecord::RecordNotUnique, :with => :user_already_added_sport

  def create
    @sportization = current_user.sportizations.build(params[:sportization])

    if params[:sportization][:position]
      @sportization.sport_id = params[:sportization][:sport_id]
      @sportization.position = params[:sportization][:position]
    else
      @sportization.position = ""
    end

    if @sportization.save
      redirect_to user_path(current_user.id, tab:Sport.find(@sportization.sport_id).name)

    else
      redirect_to current_user
    end
  end


  def update

    @sportization = current_user.sportizations.find(params[:id])

    @sportization.update_attribute(:position, params[:sportization][:position])


  end


  def destroy

    sportization = Sportization.find(params[:id])


    #We make sure to delete all the stats of the sport deleted
    if Sport.find(sportization.sport_id).name == "Basketball"
      BasketballStat.find_all_by_user_id(sportization.user_id).each do |s|
        s.update_attribute(:status, "deleted")
      end
    elsif sportization.position == "Quarterback"
      FootballQuarterbackStat.find_all_by_user_id(sportization.user_id).each do |s|
        s.update_attribute(:status, "deleted")
      end
    elsif sportization.position == "Runningback"
      FootballRunningbackStat.find_all_by_user_id(sportization.user_id).each do |s|
        s.update_attribute(:status, "deleted")
      end
    elsif sportization.position == "Receiver" or sportization.position == "Tight end"
      FootballReceiverStat.find_all_by_user_id(sportization.user_id).each do |s|
        s.update_attribute(:status, "deleted")
      end
    elsif sportization.position == "Defensive tackle"  or sportization.position == "Defensive end" or sportization.position == "Middle linebacker" or sportization.position == "Outside linebacker" or sportization.position == "Cornerback" or sportization.position == "Safety"
      FootballDefenseStat.find_all_by_user_id(sportization.user_id).each do |s|
        s.update_attribute(:status, "deleted")
      end
    end

    #Deletes the sportization for the given sport and the association between the user and the sport
    sportization.destroy

    redirect_to user_path(current_user.id, tab:Sport.find(sportization.sport_id).name)
  end


  private

  def user_already_added_sport
    redirect_to current_user, :flash => { :error => "The sport chosen has already been added" }
  end

end

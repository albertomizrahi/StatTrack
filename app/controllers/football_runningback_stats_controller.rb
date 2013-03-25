class FootballRunningbackStatsController < ApplicationController

  before_filter :signed_in_user

  def create

    @football_runningback_stat = current_user.football_runningback_stats.new(params[:football_runningback_stat])

    @football_runningback_stat.rushing_average = @football_runningback_stat.rushing_yards.to_f/(@football_runningback_stat.rushing_attempts.to_i.nonzero? || 10000)
    @football_runningback_stat.receiving_average = @football_runningback_stat.receiving_yards.to_f/(@football_runningback_stat.receptions.to_i.nonzero? || 10000)

    @football_runningback_stat.status = "Active"

    if @football_runningback_stat.save
      flash[:success] = "The stat was successfully added!"
      redirect_to user_path(current_user.id, tab:"Football")
    else
      flash[:error] = "We're sorry but we encountered an error while adding your stat."
      redirect_to user_path(current_user.id, tab:"Football")
    end

  end


  def edit

    @football_runningback_stat = current_user.football_runningback_stats.find(params[:id])

    respond_to do | format |
      format.js
    end

  end



  def update

    @football_runningback_stat = current_user.football_runningback_stats.find(params[:id])

    if @football_runningback_stat.update_attributes(params[:football_runningback_stat])

      #Update all the necessary fields
      @football_runningback_stat.update_attribute(:rushing_average, @football_runningback_stat.rushing_yards.to_f/(@football_runningback_stat.rushing_attempts.to_i.nonzero? || 10000) )
      @football_runningback_stat.update_attribute(:receiving_average, @football_runningback_stat.receiving_yards.to_f/(@football_runningback_stat.receptions.to_i.nonzero? || 10000) )


      flash[:success] = "Stat updated"
      redirect_to user_path(current_user.id, tab:"Football")

    else
      flash[:error] = "There was an error editing your stat"
      redirect_to user_path(current_user.id, tab:"Football")

    end

  end



  def destroy

    FootballRunningbackStat.find(params[:id]).update_attribute(:status, "deleted")

    redirect_to user_path(current_user.id, tab:"Football")

  end
  
end

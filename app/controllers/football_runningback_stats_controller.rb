class FootballRunningbackStatsController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy]

  def create

    @football_runningback_stat = current_user.football_runningback_stats.new(params[:football_runningback_stat])

    @football_runningback_stat.rushing_average = @football_runningback_stat.rushing_yards.to_f/(@football_runningback_stat.rushing_attempts.nonzero? || 10000)
    @football_runningback_stat.receiving_average = @football_runningback_stat.receiving_yards.to_f/(@football_runningback_stat.receptions.nonzero? || 10000)

    if @football_runningback_stat.save
      flash[:success] = "The stat was successfully added!"
      redirect_to user_path(current_user.id, tab:"Football")
    else
      flash[:error] = "There was an error adding your stat."
      redirect_to user_path(current_user.id, tab:"Football")
    end

  end


  def destroy

    FootballRunningbackStat.find(params[:id]).delete

    redirect_to user_path(current_user.id, tab:"Football")

  end
  
end

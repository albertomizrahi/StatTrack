class FootballDefenseStatsController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @football_defense_stat = current_user.football_defense_stats.new(params[:football_defense_stat])

    @football_defense_stat.total_tackles = @football_defense_stat.solo_tackles + @football_defense_stat.assisted_tackles
    @football_defense_stat.average_intercepted_return_yards = @football_defense_stat.intercepted_returned_yards.to_f/(@football_defense_stat.interceptions.nonzero? || 10000)

    if @football_defense_stat.save
      flash[:success] = "The stat was successfully added!"
      redirect_to current_user
    else
      flash[:error] = "There was an error adding your stat."
      redirect_to current_user
    end


  end

  def destroy

  end

end

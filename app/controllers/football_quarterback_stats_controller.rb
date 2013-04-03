class FootballQuarterbackStatsController < ApplicationController

  before_filter :signed_in_user

  def create

    @football_quarterback_stat = current_user.football_quarterback_stats.new(params[:football_quarterback_stat])

    @football_quarterback_stat.completion_percentage = @football_quarterback_stat.completions.to_f/(@football_quarterback_stat.passing_attempts.to_i.nonzero? || 10000)
    @football_quarterback_stat.yards_per_attempt = @football_quarterback_stat.passing_yards.to_f/(@football_quarterback_stat.passing_attempts.to_i.nonzero? || 10000)

    @football_quarterback_stat.quarterback_rating = calculate_quarterback_rating(@football_quarterback_stat.completions, @football_quarterback_stat.passing_attempts, @football_quarterback_stat.passing_yards, @football_quarterback_stat.passing_touchdowns, @football_quarterback_stat.interceptions)

    @football_quarterback_stat.yards_per_rush = @football_quarterback_stat.rushing_yards.to_f/(@football_quarterback_stat.rushing_attempts.to_i.nonzero? || 10000)

    @football_quarterback_stat.status = "Active"

    if @football_quarterback_stat.save
      flash[:success] = "The stat was successfully added!"
      redirect_to user_path(current_user.id, tab:"Football")
    else
      flash[:error] = "We're sorry but we encountered an error while adding your stat."
      redirect_to user_path(current_user.id, tab:"Football")
    end

  end


  def edit

    @football_quarterback_stat = current_user.football_quarterback_stats.find(params[:id])

    respond_to do | format |
      format.js
    end

  end



  def update

    @football_quarterback_stat = current_user.football_quarterback_stats.find(params[:id])

    if @football_quarterback_stat.update_attributes(params[:football_quarterback_stat])

      #Update all the necessary fields
      completion_percentage = @football_quarterback_stat.completions.to_f/(@football_quarterback_stat.passing_attempts.to_i.nonzero? || 10000)
      @football_quarterback_stat.update_attribute(:completion_percentage, completion_percentage )
      @football_quarterback_stat.update_attribute(:yards_per_attempt, @football_quarterback_stat.passing_yards.to_f/(@football_quarterback_stat.passing_attempts.to_i.nonzero? || 10000) )

      @football_quarterback_stat.update_attribute(:quarterback_rating, calculate_quarterback_rating(@football_quarterback_stat.completions, @football_quarterback_stat.passing_attempts, @football_quarterback_stat.passing_yards, @football_quarterback_stat.passing_touchdowns, @football_quarterback_stat.interceptions) )

      @football_quarterback_stat.update_attribute(:yards_per_rush, @football_quarterback_stat.rushing_yards.to_f/(@football_quarterback_stat.rushing_attempts.to_i.nonzero? || 10000) )


      flash[:success] = "Stat updated"
      redirect_to user_path(current_user.id, tab:"Football")

    else
      flash[:error] = "There was an error editing your stat"
      redirect_to user_path(current_user.id, tab:"Football")

    end

  end


  def destroy
    FootballQuarterbackStat.find(params[:id]).update_attribute(:status, "deleted")

    redirect_to user_path(current_user.id, tab:"Football")
  end



end

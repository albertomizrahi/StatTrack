# == Schema Information
#
# Table name: football_quarterback_stats
#
#  id                    :integer          not null, primary key
#  date_played_on        :date
#  opponent              :string(255)
#  completions           :integer
#  passing_attempts      :integer
#  completion_percentage :decimal(, )
#  passing_yards         :integer
#  yards_per_attempt     :decimal(, )
#  passing_touchdowns    :integer
#  interceptions         :integer
#  rushing_attempts      :integer
#  rushing_yards         :integer
#  fumbles               :integer
#  rushing_touchdowns    :integer
#  yards_per_rush        :decimal(, )
#  quarterback_rating    :decimal(, )
#  status                :string(255)
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class FootballQuarterbackStat < ActiveRecord::Base
  belongs_to :user
  attr_accessible :passing_attempts, :status, :completion_percentage, :completions, :date_played_on, :fumbles, :interceptions, :opponent, :passing_touchdowns, :quarterback_rating, :rushing_attempts, :rushing_touchdowns, :passing_yards, :rushing_yards, :yards_per_attempt, :yards_per_rush

  validates :passing_attempts, :completion_percentage, :completions, :fumbles, :interceptions, :opponent, :passing_touchdowns, :quarterback_rating, :rushing_attempts, :rushing_touchdowns, :passing_yards, :rushing_yards, :yards_per_attempt, :yards_per_rush, :presence => true
  validates :passing_attempts, :completion_percentage, :completions, :fumbles, :interceptions, :passing_touchdowns, :quarterback_rating, :rushing_attempts, :rushing_touchdowns, :passing_yards, :rushing_yards, :yards_per_attempt, :yards_per_rush, :numericality => true

  #Scope than only shows models whose status is not "deleted"
  scope :visible, where("status != ?", "deleted")

end

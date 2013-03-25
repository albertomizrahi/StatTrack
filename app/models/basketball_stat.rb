# == Schema Information
#
# Table name: basketball_stats
#
#  id                     :integer          not null, primary key
#  date_played_on         :date
#  opponent               :string(255)
#  time_played_in_seconds :integer
#  field_goals_made       :integer
#  field_goals_attempted  :integer
#  threepts_made          :integer
#  threepts_attempted     :integer
#  free_throws_made       :integer
#  free_throws_attempted  :integer
#  offensive_rebounds     :integer
#  defensive_rebounds     :integer
#  total_rebounds         :integer
#  assists                :integer
#  turnovers              :integer
#  steals                 :integer
#  blocks                 :integer
#  personal_fouls         :integer
#  field_goal_percentage  :decimal(, )
#  threept_percentage     :decimal(, )
#  free_throw_percentage  :decimal(, )
#  total_points           :integer
#  status                 :string(255)
#  user_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class BasketballStat < ActiveRecord::Base
  belongs_to :user
  attr_accessible :assists, :blocks, :date_played_on, :time_played_in_seconds, :defensive_rebounds, :field_goal_percentage, :field_goals_attempted, :field_goals_made, :free_throw_percentage, :free_throws_attempted, :free_throws_made, :offensive_rebounds, :opponent, :personal_fouls, :steals, :threept_percentage, :threepts_attempted, :threepts_made, :total_points, :turnovers, :total_rebounds, :minutes_played, :seconds_played, :status

  #Sets the getters and setters for the virtual attributes
  attr_accessor :minutes_played, :seconds_played

  validates :assists, :blocks, :date_played_on, :defensive_rebounds, :field_goal_percentage, :field_goals_attempted, :field_goals_made, :free_throw_percentage, :free_throws_attempted, :free_throws_made, :minutes_played, :offensive_rebounds, :opponent, :personal_fouls, :steals, :threept_percentage, :threepts_attempted, :threepts_made, :total_points, :turnovers, :presence => true
  validates :assists, :blocks, :defensive_rebounds, :field_goal_percentage, :field_goals_attempted, :field_goals_made, :free_throw_percentage, :free_throws_attempted, :free_throws_made, :minutes_played, :offensive_rebounds, :personal_fouls, :steals, :threept_percentage, :threepts_attempted, :threepts_made, :total_points, :turnovers, :numericality => true

  #Scope than only shows models whose status is not "deleted"
  scope :visible, where("status != ?", "deleted")



end

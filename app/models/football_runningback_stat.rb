# == Schema Information
#
# Table name: football_runningback_stats
#
#  id                   :integer          not null, primary key
#  date_played_on       :date
#  opponent             :string(255)
#  rushing_attempts     :integer
#  rushing_yards        :integer
#  rushing_average      :decimal(, )
#  longest_run          :integer
#  rushing_touchdowns   :integer
#  receptions           :integer
#  receiving_yards      :integer
#  receiving_average    :decimal(, )
#  longest_reception    :integer
#  receiving_touchdowns :integer
#  fumbles              :integer
#  fumbles_lost         :integer
#  user_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class FootballRunningbackStat < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date_played_on, :fumbles, :fumbles_lost, :longest_reception, :longest_run, :opponent, :receiving_average, :receiving_touchdowns, :receiving_yards, :receptions, :rushing_attempts, :rushing_average, :rushing_touchdowns, :rushing_yards
end

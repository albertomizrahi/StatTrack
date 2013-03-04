# == Schema Information
#
# Table name: football_defense_stats
#
#  id                                   :integer          not null, primary key
#  date_played_on                       :date
#  opponent                             :string(255)
#  solo_tackles                         :integer
#  total_tackles                        :integer
#  assisted_tackles                     :integer
#  sacks                                :decimal(, )
#  stuffs                               :integer
#  stuff_yards                          :integer
#  forced_fumbles                       :integer
#  fumbles_recovered                    :integer
#  fumbles_returned_for_touchdown       :integer
#  kicks_blocked                        :integer
#  interceptions                        :integer
#  intercepted_returned_yards           :integer
#  average_intercepted_return_yards     :decimal(, )
#  longest_interception_return          :integer
#  interceptions_returned_for_touchdown :integer
#  passes_defended                      :integer
#  safeties                             :integer
#  user_id                              :integer
#  created_at                           :datetime         not null
#  updated_at                           :datetime         not null
#

class FootballDefenseStat < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date_played_on, :opponent, :assisted_tackles, :average_intercepted_return_yards, :kicks_blocked, :solo_tackles, :forced_fumbles, :fumbles_recovered, :fumbles_returned_for_touchdown, :intercepted_returned_yards, :interceptions, :interceptions_returned_for_touchdown, :longest_interception_return, :passes_defended, :sacks, :safeties, :stuff_yards, :stuffs, :total_tackles
end

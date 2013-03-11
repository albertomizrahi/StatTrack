# == Schema Information
#
# Table name: football_receiver_stats
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
#  reception_targets    :integer
#  receiving_yards      :integer
#  receiving_average    :decimal(, )
#  longest_reception    :integer
#  receiving_touchdowns :integer
#  fumbles              :integer
#  fumbles_lost         :integer
#  status               :string(255)
#  user_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class FootballReceiverStat < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date_played_on, :status, :fumbles, :fumbles_lost, :longest_reception, :longest_run, :opponent, :receiving_average, :receiving_touchdowns, :receiving_yards, :reception_targets, :receptions, :rushing_attempts, :rushing_average, :rushing_touchdowns, :rushing_yards

  #Scope than only shows models whose status is not "deleted"
  scope :visible, where("status != ?", "deleted")

end

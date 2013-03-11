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
#  status               :string(255)
#  user_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'spec_helper'

describe FootballRunningbackStat do
  pending "add some examples to (or delete) #{__FILE__}"
end

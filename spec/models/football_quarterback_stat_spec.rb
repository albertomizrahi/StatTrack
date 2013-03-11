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

require 'spec_helper'

describe FootballQuarterbackStat do
  pending "add some examples to (or delete) #{__FILE__}"
end

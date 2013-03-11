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

require 'spec_helper'

describe BasketballStat do
  pending "add some examples to (or delete) #{__FILE__}"
end

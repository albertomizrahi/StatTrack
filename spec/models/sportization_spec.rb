# == Schema Information
#
# Table name: sportizations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  sport_id   :integer
#  position   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Sportization do
  pending "add some examples to (or delete) #{__FILE__}"
end

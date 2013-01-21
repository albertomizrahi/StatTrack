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

class Sportization < ActiveRecord::Base
  attr_accessible :position, :sport_id

  belongs_to :user
  belongs_to :sport

  validates :user_id, presence: true
  validates :sport_id, presence: true
  validates :position, presence: true

end

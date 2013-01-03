class Sportization < ActiveRecord::Base
  attr_accessible :position, :sport_id

  belongs_to :user
  belongs_to :sport

  validates :user_id, presence: true
  validates :sport_id, presence: true
  validates :position, presence: true

end

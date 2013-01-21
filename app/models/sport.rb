# == Schema Information
#
# Table name: sports
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sport < ActiveRecord::Base
  attr_accessible :name

  has_many :sportizations
  has_many :users, :through => :sportizations

  validates :name, :uniqueness => true

end

class Sport < ActiveRecord::Base
  attr_accessible :name

  has_many :sportizations
  has_many :users, :through => :sportizations

end

class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include FootballQuarterbackStatsHelper
  include UsersHelper
  include SportizationsHelper
  include BasketballStatsHelper

end

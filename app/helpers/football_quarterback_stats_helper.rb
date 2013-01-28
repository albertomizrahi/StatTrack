module FootballQuarterbackStatsHelper

  #A method to calculate the quarterback rating
  def calculate_quarterback_rating (completions, attempts, yards, touchdowns, interceptions)
    #The following link shows how to calculate passer rating: http://en.wikipedia.org/wiki/Passer_rating

    attempts = attempts.to_f

    a = (completions/(attempts.nonzero? || 1) - 0.3)*5
    if a < 0
      a = 0
    elsif a > 2.375
      a = 2.375
    end


    b = (yards/(attempts.nonzero? || 1) - 3)*0.25
    if b < 0
      b = 0
    elsif b > 2.375
      b = 2.375
    end


    c = (touchdowns/(attempts.nonzero? || 1))*20
    if c < 0
      c = 0
    elsif c > 2.375
      c = 2.375
    end


    d = 2.375 - (interceptions/(attempts.nonzero? || 1))*25
    if d < 0
      d = 0
    elsif d > 2.375
      d = 2.375
    end

    return ((a+b+c+d)/6)*100

  end




end

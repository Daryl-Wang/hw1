class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  strat0 = game[ 0 ][ 1 ]
  strat1 = game[ 1 ][ 1 ]
  raise NoSuchStrategyError unless ( /^[RPS]/i =~ strat0 && /^[RPS]/i =~ strat1 )
  if strat0.downcase == strat1.downcase
    return game[ 0 ]
  elsif /R/i =~ strat0
    if /S/i =~ strat1
      return game[ 0 ]
    else
      return game[ 1 ]
    end
  elsif /S/i =~ strat0
    if /P/i =~ strat1
      return game[ 0 ]
    else
      return game[ 1 ]
    end
  elsif /P/i =~ strat0
    if /R/i =~ strat1
      return game[ 0 ]
    else
      return game[ 1 ]
    end
  end
end

def rps_tournament_winner(tournament)
  if tournament[ 0 ][ 0 ].kind_of? String
    return rps_game_winner( tournament )
  else
    winner0 = rps_tournament_winner( tournament[ 0 ] )
    winner1 = rps_tournament_winner( tournament[ 1 ] )
    return rps_game_winner( [ winner0, winner1 ] )
  end
end


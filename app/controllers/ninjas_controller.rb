class NinjasController < ApplicationController
# Note: in the real world you wouldn't store this much data in session, it session hold that much data. This is just to learn how to use it.
  def index
      if !session[:gold]
          session[:gold] = 0
          # Make an array messages being displayed at the bottom box on index.html.erb
          session[:activities] = []
      end
      @gold = session[:gold]

      # Set a variable equal to the session activities array
      @activities = session[:activities]
  end

  def farm
      amount = rand(10..20)
      session[:gold] += amount

      obj = {won: true, sentence: "You won #{amount} gold from the farm"}
      session[:activities].push(obj)  # push the object to the array

      redirect_to "/"
  end

  def house
      amount = rand(2..5)
      session[:gold] += amount
      obj = {won: true, sentence: "You won #{amount} gold from a house"}
      session[:activities].push(obj)
      redirect_to "/"
  end

  def cave
      amount = rand(5..10)
      session[:gold] += amount
      obj = {won: true, sentence: "You won #{amount} gold from the cave"}
      session[:activities].push(obj)
      redirect_to "/"
  end

  def casino
      amount = rand(-50..50)
      session[:gold] += amount
      winner = true
      if amount >= 0
          obj = {won: true, sentence: "You won #{amount} gold from the casino"}
          session[:activities].push(obj)
      else
          obj = {won: false, sentence: "You lost #{amount} gold from the casino"}
          session[:activities].push(obj)
      end
      redirect_to "/"
  end

end

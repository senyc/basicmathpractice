class GamesController < ApplicationController
  def check
    value_one = params[:value_one].to_i
    value_two = params[:value_two].to_i
    result = params[:result].to_i

    case params[:game_type]
    when 'multiplication' then correct = value_one * value_two == result
    when 'addition' then correct = value_one + value_two == result
    when 'subtraction' then correct = value_one - value_two == result
    when 'division' then correct = value_one / value_two == result
    end

    if correct
      session[:complete] = session[:complete] ? session[:complete] + 1 : 0
      generate_new_values
      redirect_to action: :check and return
    end
    flash[:error] = "The product of #{value_one} and #{value_two} is not equal to #{result}."
    redirect_to action: :check and return
  end

  def reset
    session[:complete] = 0
    redirect_to '/games/multiplication'
  end

  def multiplication
    session[:value_one] or generate_new_values
    @game_type = 'multiplication'
    @value_one = session[:value_one]
    @value_two = session[:value_two]
    @complete = session['complete'] || 0
  end

  def addition
    session[:value_one] or generate_new_values
    @game_type = 'addition'
    @value_one = session[:value_one]
    @value_two = session[:value_two]
    @complete = session['complete'] || 0
  end

  def subtraction
    session[:value_one] or generate_new_values
    @game_type = 'subtraction'
    @value_one = session[:value_one]
    @value_two = session[:value_two]
    @complete = session['complete'] || 0
  end

  def division
    session[:value_one] or generate_new_values
    @game_type = 'division'
    @value_one = session[:value_one]
    @value_two = session[:value_two]
    @complete = session['complete'] || 0
  end

  def generate_new_values
    session[:value_one] = rand(2...21)
    session[:value_two] = rand(2...21)
  end
end

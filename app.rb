require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  # Write your code here!
  get "/reversename/:name" do
    @name = params[:name]
    @name.reverse
  end

  get "/square/:number" do
    @num = params[:number].to_i
    (@num ** 2).to_s
  end

  get "/say/:number/:phrase" do
    @num = params[:number].to_i
    @phrases = [params[:phrase]] * @num
    @phrases.join
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    params.values.join(" ") + '.'
  end

  get "/:operation/:number1/:number2" do
    @operation = params[:operation]
    @n1 = params[:number1].to_i
    @n2 = params[:number2].to_i
    case @operation
    when 'add'
      (@n1 + @n2).to_s
    when 'subtract'
      (@n1 - @n2).to_s
    when 'multiply'
      (@n1 * @n2).to_s
    when 'divide'
      (@n1 / @n2).to_s
    end
  end
end

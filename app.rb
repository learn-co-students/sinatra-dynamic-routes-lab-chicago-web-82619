require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do 
    name = params[:name]
    name.reverse
  end

  get '/square/:number' do 
    (params[:number].to_i ** 2).to_s
  end

  get '/say/:number/:phrase' do 
    result = ""

    params[:number].to_i.times do 
     result << params[:phrase]
    end

    result
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do 
    params.values.join(" ") + "."
  end

  get '/:operation/:number1/:number2' do 
    operations = {
      'add' => :+,
      'subtract'=> :-,
      'multiply'=> :*,
      'divide'=> :/
    }
    
    op = params[:operation]
  
    [params[:number1], params[:number2]].map(&:to_i).inject(operations[op]).to_s
  end



end
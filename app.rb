require 'rubygems'
require 'pry'
require 'sinatra'
require_relative 'customer'

class RewardSystem < Sinatra::Base
  set :public_folder, Proc.new { File.join(File.dirname(__FILE__), 'content') }

  get '/' do
    erb :home, locals: { customers: "" }
  end
  
end

require 'rubygems'
require 'pry'
require 'sinatra'
require_relative 'customer'

class RewardSystem < Sinatra::Base
  set :public_folder, Proc.new { File.join(File.dirname(__FILE__), 'content') }

  get '/' do
    erb :home
  end
  
  post '/result' do
    customers = {}
    params[:document] && params[:document][:tempfile].read.each_line do |line|
      line = line.gsub(/[^a-zA-Z ]/,'').strip.split(' ')
      action = line[1].to_sym
      case action
      when :recommends
        next unless line[2]
        inviter, invitee = line[0], line[2] 
        customers[inviter] = customers[inviter] || Customer.new;
        customers[invitee] = customers[invitee] || Customer.new;
        customers[inviter].recommends(customers[invitee])
      when :accepts
        invitee = line[0]
        next unless customers[invitee]
        customers[invitee].accepts
      end
    end
    customers.each { |key, value| customers[key] = value.point}
    erb :result, locals: { customers: customers }
  end
end

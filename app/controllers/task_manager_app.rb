require_relative '../models/task.rb'
require 'pry'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @location = params["location"]
    @tasks = Task.all
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    task = Task.new(params[:task])
    task.save
    redirect '/tasks'
  end

  get '/tasks/:id' do
    @task = Task.find(params[:id])
    erb :show
  end

  get '/easteregg' do
    erb :easter
  end

  get '/showmethetask' do
    redirect '/tasks/:id'
  end

  get '/tasks/:id/edit' do
    @task = Task.find(params[:id])
    erb :edit
  end

  put '/tasks/:id' do |id|
    Task.update(id.to_i, params[:task])
    redirect '/tasks/#{id}'
  end

  delete '/tasks/:id' do |id|
    Task.destroy(id.to_i)
    redirect '/tasks'
  end

end

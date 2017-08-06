class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = ["task1", "task2", "task3"]
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    "<p>Params: #{params}</p> <p>Task params: #{params[:task]}</p>"
  end
  
end

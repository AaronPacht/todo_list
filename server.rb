require 'sinatra'
require_relative 'Todos'

get '/' do
    redirect to('/home')
end

get '/home' do
    @title="home"
    @todos=Todos.all
    erb :home
end

get '/createTodo' do
    @title="create"
    erb :createTodo
end

post '/create' do
    newTodo=Todos.new
    newTodo.name=params["name"]
    newTodo.place=params["place"]
    newTodo.note=params["note"]
    newTodo.save
    redirect to("/home")
end

get '/view/:id' do
    @title="view"
    @todo=Todos.find(params["id"])
    erb :view
end

get '/updateTodo/:id' do
    @title="update"
    @todo=Todos.find(params["id"])
    erb :updateTodo
end

post '/update/:id' do
    todo=Todos.find(params["id"])
    todo.name=params["name"]
    todo.place=params["place"]
    todo.note=params["note"]
    todo.save
    redirect to("/home")
end

get '/deleteTodo/:id' do
    todo=Todos.find(params["id"])
    todo.delete
    redirect to("/home")
end
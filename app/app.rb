ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :form
  end

  post '/links' do
    link = Link.new(url: params[:Link],
                     title: params[:Title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

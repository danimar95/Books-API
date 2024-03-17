class AuthorsController < ApplicationController
  def index
    @authors = Author.eager_load(:books).all
    render json: @authors.to_json({ include: :books })
  end

  def show
    @author = Author.find(params[:id])
    render json: @author.to_json({ include: :books })
  end

  def create
    @author = Author.create(name: params[:name], last_name: params[:last_name])
    render json: @author
  end

  def update
    @author = Author.find(params[:id])
    @author.update(name: params[:name])
    render json: @author
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    render json: {}
  end
end

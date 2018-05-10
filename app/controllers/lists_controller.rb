class ListsController < ApplicationController

  before_action :set_list, only:[:show, :edit, :update, :destroy]

  def index
    @lists = List.all.order('created_at DESC')
    @newList = List.new
    @tasks = Task.where("done = 0").order('deadline')
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to lists_path
    else
      render 'edit'
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  def search
    @lists = List.search(params[:search])
    @tasks = Task.search(params[:search])
  end

  def result
    @AllList = List.all
    @lists = List.where("title LIKE ?","%" + params[:search] + "%").order('created_at DESC')
    @tasks = Task.where("title LIKE ?","%" + params[:search] + "%").order('created_at DESC')
  end

  private
    def list_params
      params[:list].permit(:title)
    end

    def set_list
      @list = List.find(params[:id])
    end
end

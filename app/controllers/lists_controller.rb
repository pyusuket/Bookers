class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
    @lists = List.all
  end
  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Book was successfully updated."
      redirect_to list_path(@list.id)
    else
      @lists = List.all
      render :new   
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])  
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to list_path(@list.id)
    else
      @lists = List.all
      render :edit
    end
  end
  
  def destroy
    list = List.find(params[:id])  
    list.destroy  
    redirect_to '/lists/new'  
  end
  
  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end

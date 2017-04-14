class YearbooksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_yearbook, only: [:show, :edit, :destroy]

  def index
    @yearbooks = Yearbook.all
  end

  def show
  end

  def new
    @yearbook = current_user.yearbooks.build
  end

  def create
    @yearbook = current_user.yearbooks.build(yearbook_params)

    if @yearbook.save
      flash[:success] = "Yearbook created!"
      redirect_to yearbooks_path
    else
      flash[:danger] = "Failed to create yearbook!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @yearbook.update(yearbook_params)
      flash[:success] = "Yearbook updated!"
      redirect_to @yearbook
    else
      flash[:danger] = "Failed to update yearbook!"
      render 'edit'
    end
  end

  def destroy
    @yearbook.destroy
    flash[:success] = "Yearbook deleted!"
    redirect_to request.referrer
  end

  private

  def yearbook_params
    params.require(:yearbook).permit(:title)
  end

  def find_yearbook
    @yearbook = Yearbook.find(params[:id])
  end
end

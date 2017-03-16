class YearbooksController < ApplicationController
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
    else
      flash[:danger] = "Failed to update yearbook!"
      redirect_to 'edit'
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
end

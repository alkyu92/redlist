class StoriesController < ApplicationController
  before_action :find_story, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @stories = Story.includes(:user).order("created_at DESC")
  end

  def show
  end

  def new
    @story = current_user.stories.build
  end

  def create
    @story = current_user.stories.build(params_story)

    if @story.save
      flash[:success] = "Story posted!"
      redirect_to @story
    else
      flash[:danger] = "Failed to post story!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @story.update(params_story)
      if params[:attached]
          @story.pic.destroy
      end

      flash[:success] = "Story updated!"
      redirect_to @story
    else
      flash[:danger] = "Failed to update story!"
      render 'edit'
    end
  end

  def destroy
    @story.destroy
    flash[:success] = "Story deleted!"
    redirect_to request.referrer
  end

  private

  def params_story
    params.require(:story).permit(:title, :story, :pic, :anonymous)
  end

  def find_story
    @story = Story.includes(:user).find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Story unavailable!"
    redirect_to stories_path

  end
end

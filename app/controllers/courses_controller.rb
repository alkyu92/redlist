class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group
  before_action :find_course, only: [:edit, :update, :destroy]

  def new
    @course = @group.courses.build
  end

  def create
    @course = @group.courses.build(params_course)

    if @course.save
      flash[:success] = "Course entry posted!"
      redirect_to @group
    else
      flash[:danger] = "Failed to post course entry!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @course.update(params_course)
      flash[:success] = "Course entry updated!"
      redirect_to @group
    else
      flash[:danger] = "Failed to update course entry!"
      render 'edit'
    end
  end

  def destroy
    @course.destroy
    flash[:success] ="Course entry deleted!"
    redirect_to request.referrer
  end

  private
  def find_group
    @group = Group.find(params[:group_id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Group unavailable!"
    redirect_to groups_path

  end

  def find_course
    @course = Course.where(group_id: @group).find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Course entry unavailable!"
    redirect_to @group

  end

  def params_course
    params.require(:course).permit(:title, :place, :description)
  end
end

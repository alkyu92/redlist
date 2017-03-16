class AwardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group
  before_action :find_award, only: [:edit, :update, :destroy]

  def new
    @award = @group.awards.build
  end

  def create
    @award = @group.awards.build(params_award)

    if @award.save
      flash[:success] = "Award entry posted!"
      redirect_to @group
    else
      flash[:danger] = "Failed to post award entry!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @award.update(params_award)
      flash[:success] = "Award entry updated!"
      redirect_to @group
    else
      flash[:danger] = "Failed to update award entry!"
      render 'edit'
    end
  end

  def destroy
    @award.destroy
    flash[:success] ="Award entry deleted!"
    redirect_to request.referrer
  end

  private
  def find_group
    @group = Group.find(params[:group_id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Group unavailable!"
    redirect_to groups_path
  end

  def find_award
    @award = Award.where(group_id: @group).find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Award entry unavailable!"
    redirect_to @group
  end

  def params_award
    params.require(:award).permit(:title, :event, :description)
  end
end

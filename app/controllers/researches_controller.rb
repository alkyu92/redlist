class ResearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group
  before_action :find_research, only: [ :edit, :update, :destroy]

  def new
    @research = @group.researches.build
  end

  def create
    @research = @group.researches.build(params_research)

    if @research.save
      flash[:success] = "Research posted!"
      redirect_to @group
    else
      flash[:danger] = "Failed to post research!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @research.update(params_research)
      flash[:success] = "research updated!"
      redirect_to @group
    else
      flash[:danger] = "Failed to update research!"
      render 'edit'
    end
  end

  def destroy
    @research.destroy
    flash[:success] ="research deleted!"
    redirect_to request.referrer
  end

  private
  def find_group
    @group = Group.find(params[:group_id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Group unavailable!"
    redirect_to groups_path

  end

  def find_research
    @research = Research.where(group_id: @group).find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Research entry unavailable!"
    redirect_to @group

  end

  def params_research
    params.require(:research).permit(:major, :specialization, :description)
  end
end

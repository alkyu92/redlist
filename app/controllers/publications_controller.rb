class PublicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group
  before_action :find_publication, only: [:edit, :update, :destroy]

  def new
    @publication = @group.publications.build
  end

  def create
    @publication = @group.publications.build(params_publication)

    if @publication.save
      flash[:success] = "Publication posted!"
      redirect_to @group
    else
      flash[:danger] = "Failed to post publication!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @publication.update(params_publication)
      flash[:success] = "Publication updated!"
      redirect_to @group
    else
      flash[:danger] = "Failed to update publication!"
      render 'edit'
    end
  end

  def destroy
    @publication.destroy
    flash[:success] = "Publication deleted!"
    redirect_to request.referrer
  end

  private

  def find_group
    @group = Group.find(params[:group_id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Group unavailable!"
    redirect_to groups_path

  end

  def find_publication
    @publication = Publication.where(group_id: @group).find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Publication entry unavailable!"
    redirect_to @group

  end

  def params_publication
    params.require(:publication).permit(:title, :event, :description)
  end
end

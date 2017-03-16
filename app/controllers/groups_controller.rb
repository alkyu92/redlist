class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @groups = Group.order("created_at DESC")
  end

  def show
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      if params[:pics]
        params[:pics].each { |pic|
          @group.group_pics.create!(pic: pic)
        }
      end

      flash[:success] = "Group created!"
      redirect_to @group
    else
      flash[:danger] = "Failed to create group!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      if params[:pics]
        params[:pics].each { |pic|
          @group.group_pics.create!(pic: pic)
        }
      end

      if params[:attached]
        params[:attached].each { |attached|
          @group.group_pics.where(id: attached).destroy_all
        }
      end

      flash[:success] = "Group updated!"
      redirect_to @group
    else
      flash[:danger] = "Failed to update group!"
      redirect_to 'edit'
    end
  end

  def destroy
    @group.destroy
    flash[:success] = "Group deleted!"
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :department, :email,
                                  :address, :phone, :group_pic,
                                  group_pics_attributes: [ pic: [] ])
  end

  def find_group
    @group = Group.includes(:people, :awards, :publications, :researches,
    :courses, :group_pics).find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Group unavailable!"
    redirect_to groups_path
  end
end

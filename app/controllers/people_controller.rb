class PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group
  before_action :find_people, only: [:edit, :update, :destroy]

  def new
    @people = @group.people.build
  end

  def create
    @people = @group.people.build(params_people)

    if @people.save
      flash[:success] = "People created!"
      redirect_to @group
    else
      flash[:danger] = "Failed to create profile!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @people.update(params_people)
      if params[:attached]
        @people.profile_pic.destroy
      end

      flash[:success] = "People updated!"
      redirect_to @group
    else
      flash[:danger] = "Failed to update!"
      render 'edit'
    end
  end

  def destroy
    @people.destroy
    flash[:success] = "Profile deleted!"
    redirect_to @group
  end

  private
  def find_group
    @group = Group.find(params[:group_id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Group unavailable!"
    redirect_to groups_path

  end

  def find_people
    @people = Person.where(group_id: @group).find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Person entry unavailable!"
    redirect_to @group

  end

  def params_people
    params.require(:person).permit(:profile_pic, :name, :occupation_id, :level, :intro, :email)
  end
end

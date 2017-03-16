class AdvertisementsController < ApplicationController
  before_action :find_ads, only: [:show,
      :edit, :update, :destroy, :delete_attachment, :delete_all_attachment]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    if params[:category].blank? || params[:category] == "All Categories"
      @advertisements = Advertisement.where("validity IS NULL OR validity > ?",
      Time.now).order("created_at DESC").page(params[:page])
    else
      @category_id = Category.find_by(name: params[:category]).id
      @advertisements = Advertisement.where(category_id: @category_id).where("validity IS NULL OR validity > ?",
      Time.now).order("created_at DESC").page(params[:page])
    end
  end

  def show
    if user_signed_in?
      @noty = current_user.notifications.where(advertisement_id: params[:id],read: false)
      unless @noty.nil?
        @noty.update_all(read: true)
      end
    end
  end

  def new
    @advertisement = current_user.advertisements.build
  end

  def create
    @advertisement = current_user.advertisements.build(ad_params)

    if @advertisement.save
      if params[:images]
        params[:images].each { |image|
          @advertisement.documents.create!(doc: image)
        }
      end

      flash[:success] = "Advertisement posted!"
      redirect_to advertisement_path(@advertisement)
    else
      flash[:danger] = "Failed to post advertisement!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @advertisement.update(ad_params)
      if params[:images]
        params[:images].each { |image|
          @advertisement.documents.create!(doc: image)
        }
      end

      if params[:attached]
        params[:attached].each { |attached|
          @advertisement.documents.where(id: attached).destroy_all
        }
      end

      update_ads_notification(@advertisement)
      flash[:success] = "Advertisement updated!"
      redirect_to advertisement_path(@advertisement)
    else
      flash[:danger] = "Failed to update advertisement!"
      redirect_to 'edit'
    end
  end

  def destroy
    @advertisement.destroy
    flash[:success] = "Advertisement deleted!"
    redirect_to advertisements_path
  end

  private
    def ad_params
      params.require(:advertisement).permit(:name, :title, :amount, :description,
                                    :address, :contact, :category_id, :requirement,
                                    :bizhour, :website, :email, :validity,
                                    :enable_comment, :document,
                                    documents_attributes: [ doc: [] ])
    end

    def find_ads
      @advertisement_user_id = Advertisement.includes(:user,
      :comments, :documents).find(params[:id]).user_id

      if user_signed_in? && (current_user.id == @advertisement_user_id || current_user.privilege == "sudo")
        @advertisement = Advertisement.includes(:user,
        :comments, :documents).find(params[:id])
      else
        @advertisement = Advertisement.includes(:user,
        :comments, :documents).where("validity IS NULL OR validity > ?",
        Time.now).find(params[:id])
      end

      rescue ActiveRecord::RecordNotFound
        flash[:notice] = "Advertisement unavailable!"
        redirect_to advertisements_path
    end

    def update_ads_notification(advertisement)
      noty = Notification.includes(:user, :advertisement).where(advertisement_id: advertisement.id)
      noty.update_all(validity: advertisement.validity)
    end
end

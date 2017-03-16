class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @noties = current_user.notifications.order("created_at DESC").page(params[:page])
  end
end

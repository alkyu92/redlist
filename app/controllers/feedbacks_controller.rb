class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params_feedback)

    if @feedback.save
      flash[:success] = "Posted!"
      redirect_to request.referrer
    else
      flash[:danger] = "Failed to post feedbacks or inquiries!"
      redirect_to request.referrer
    end
  end

  private
  def params_feedback
    params.require(:feedback).permit(:inquiry, :email)
  end
end

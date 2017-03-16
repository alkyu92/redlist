class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id

    if params[:advertisement_id]
      @comment.advertisement_id = @commentable.id
    elsif params[:comment_id]
      @comment.advertisement_id = @commentable.commentable_id
    end

    if @comment.save
      create_notification(@comment)
      flash[:success] = "Comment created!"
      redirect_to request.referrer
    else
      flash[:danger] = "Failed to submit comment!"
      redirect_to request.referrer
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:advertisement_id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.info = "edited"

    if @comment.update(comment_params)
      #update_comment_notification(@comment)
      flash[:success] = "Comment updated!"
      redirect_to advertisement_path(@comment.advertisement_id)
    else
      flash[:danger] = "Failed to update comment!"
      redirect_to 'edit'
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:advertisement_id])
    @comment.destroy
    flash[:success] = "Comment deleted!"
    redirect_to request.referrer
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :info)
    end

    def find_commentable
      @commentable = Advertisement.find_by_id(params[:advertisement_id]) if params[:advertisement_id]
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      rescue ActiveRecord::RecordNotFound
        flash[:notice] = "Advertisement has expired!"
        redirect_to root_path
    end

    def create_notification(input)
      ads = Advertisement.find_by_id(input.advertisement_id)
      com = Comment.where(commentable_type: "Advertisement", id: input.commentable_id)
      child_com = Comment.where(commentable_type: "Comment", commentable_id: input.commentable_id)

      affected_id = []
      affected_id.push(ads.user.id)
      affected_id |= com.map{|c| c.user_id}
      affected_id |= child_com.map{|c| c.user_id}

      affected_id.each do |id|
      next if current_user.id == id
      Notification.create(user_id: id,
                          #who will get the notification

                          notified_by_id: current_user.id,
                          #who commented on the post

                          advertisement_id: input.advertisement_id,
                          #direct current user to advertisement page
                          #that contain the comment

                          validity: ads.validity,
                          #ads validity, notification will disappear
                          #when exceed the validity

                          info: "posted",
                          #posted or edited

                          body: input.body,

                          comment_type: input.commentable_type
                          #ads comment or comment on comment
                          )
      end
    end

    def update_comment_notification(input)
      ads = Advertisement.find_by_id(input.advertisement_id)
      Notification.create(user_id: input.user_id,
                          notified_by_id: current_user.id,
                          advertisement_id: input.advertisement_id,
                          validity: ads.validity,
                          info: "edited",
                          body: input.body,
                          comment_type: input.commentable_type
                          )
    end
end

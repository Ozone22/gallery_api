module V1
  class CommentsController < ApplicationController
    before_action :authenticate_user
    before_action :authorize_user, only: %i(destroy)

    expose(:comment)
    expose(:wallpaper)
    expose(:comments) { paginated_comments }

    def create
      comment.user = current_user
      comment.wallpaper = wallpaper
      if comment.save
        head :created
      else
        respond_with :v1, comment
      end
    end

    def index
      render json: comments
    end

    def destroy
      comment.destroy!
      head :no_content
    end

    private

    def paginated_comments
      comments = wallpaper.comments.order(:created_at)
      comments.page(params[:page]).per(params[:per_page] || 10)
    end

    def comment_params
      params.require(:comment).permit(:text)
    end

    def authorize_user
      authorize(comment, :allowed?)
    end
  end
end

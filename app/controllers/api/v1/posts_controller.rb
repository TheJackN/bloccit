class Api::V1::PostsController < Api::V1::BaseController

  before_filter :authenticate_user, except: [:show]
  before_filter :authorize_user, only: [:update, :destroy]

  def show
    post = Post.find(params[:id]).to_json
    comments = Comment.where(post_id: post.id).to_json
    favorites = Favorite.where(post_id: post.id).to_json
    render json: post.to_json(:include => [comments, favorites])
  end

  def update
    post = Post.find(params[:id])

    if post.update_attributes(post_params)
      render json: post.to_json, status: 200
    else
      render json: {error: "Post update failed", status: 400}, status: 400
    end
  end

  def destroy
    post = Post.find(params[:id])

    if post.destroy
      render json: {message: "Post destroyed", status: 200}, status: 200
    else
      render json: {error: "Post destroy failed", status: 400}, status: 400
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end

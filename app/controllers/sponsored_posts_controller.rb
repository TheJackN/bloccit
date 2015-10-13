class SponsoredPostsController < ApplicationController
  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = @topic.sponsored_posts.new(sponsored_post_params)

    if @sponsored_post.save
      flash[:notice] = "Sponsored Post Saved Successfully"
      redirect_to [@topic, @sponsored_post]
    else
      flash[:error] = "There was an error creating sponsored post. Please try again"
      render :new
    end
  end

  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def update
    @sponsored_post = SponsoredPost.find(params[:id])

    if @sponsored_post.update_attributes(sponsored_post_params)
      flash[:notice] = "Sponsored Post Updated Successfully"
      redirect_to [@sponsored_post.topic, @sponsored_post]
    else
      flash[:error] = "There was an error updating sponsored post. Please try again"
      render :edit
    end
  end

  def destroy
    @sponsored_post = SponsoredPost.find(params[:id])

    if @sponsored_post.destroy
      flash[:notice] = "Sponsored Post Deleted Successfully"
      redirect_to @sponsored_post.topic
    else
      flash[:error] = "There was an error deleting sponsored post."
      render :show
    end
  end

  private
  def sponsored_post_params
    params.require(:sponsored_post).permit(:title, :body, :price)
  end
end

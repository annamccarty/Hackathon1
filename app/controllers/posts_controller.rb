class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :edit, :destroy]
  before_action :get_user

    def index
      @posts = Post.all
    end

    def show
    end

    def new
      @post = Post.new
      render partial: "form"
    end

    def edit
      render partial: "form"
    end

    def create
      @post = @user.posts.new(post_params)
      @post.user_id = current_user.id

      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end

    def update
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit
      end
    end

    def destroy
      @post.destroy
      redirect_to posts_path
    end

    private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:image)
      end

      def get_user
        @user = current_user
      end
  end

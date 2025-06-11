class PostsController < ApplicationController
    before_action :set_post, only:[:edit, :update, :destroy]

    # ここにlocalhost:3000/posts/indexの処理を書く
    def index
        @posts = Post.all
    end

    # ここにlocalhost:3000/posts/newの処理を書く
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to posts_path
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    # privateメソッドを記載した下側は、コントローラーの外からは呼び出せない
    private
    def post_params
        params.require(:post).permit(:title, :content)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end

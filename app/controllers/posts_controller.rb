class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
   skip_before_action :verify_authenticity_token


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.includes(:comments, :user)
    if params[:q].present?
      @posts = Post.where("title LIKE ?", "%#{params[:q]}%")
    else
      @posts = Post.all.order('updated_at desc')
    end

    # @posts = Post.all.reverse #devuelve todos los posts y los guarda en la variable @posts
    @post = Post.new #un Post.new es vacio, por que es nuevo y lo guardo en la variable @post

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments.build
    @last_comments = @post.comments.last(5)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_url, notice: 'Post was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :address, :price, :photo )
    end
  end

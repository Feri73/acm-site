class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    # @posts = Post.order('publishDate DESC').limit(10)
    first=(params[:first].to_i ||= 0) 
    last=(params[:last].to_i ||= 10) 
    @posts = Post.all(first..last).order(:publishDate).reverse()
    # if params.has_key?(:english)
    #   @eng= (params[:english]=="1")
    # else
    #   @eng=false
    # end
    # logger.info "ASDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD"
    # logger.info params.has_key?(:english)
    # logger.info params[:english]
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    # if params.has_key?(:english)
    #   @eng= (params[:english]=="1")
    # else
    #   @eng=false
    # end
  end

  # GET /posts/new
  def new
    authorize_user
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    authorize_user
  end

  # POST /posts
  # POST /posts.json
  def create
    authorize_user
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: I18n.t('post_created') }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize_user
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: I18n.t('post_updated') }
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
    authorize_user
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: I18n.t('post_deleted') }
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
      params.require(:post).permit(:title, :summary, :text, :tags, :publishDate, :category_id, :image_url,:englishTitle, :englishSummary, :englishText)
    end
end

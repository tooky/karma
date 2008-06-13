class Posts < Application
  provides :html, :xml
  before :authenticate, :exclude => [:index, :show] 

  def index
    @posts = Post.find(:all, :order => 'created_at DESC', :limit => 10)
    display @posts
  end

  def show
    @post = Post.find_by_slug(params[:id])
    raise NotFound unless @post
    display @post
  end

  def new
    only_provides :html
    @post = Post.new
    render
  end

  def edit
    only_provides :html
    @post = Post.find(params[:id])
    raise NotFound unless @post
    render
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect @post.permalink
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    raise NotFound unless @post
    if @post.update_attributes(params[:post]) || !@post.dirty?
      redirect @post.permalink
    else
      raise BadRequest
    end
  end
  
  def delete
    only_provides :html
    @post = Post.find(params[:id])
    raise NotFound unless @post
    render
  end

  def destroy
    @post = Post.find(params[:id])
    raise NotFound unless @post
    if @post.destroy
      redirect url(:post)
    else
      raise BadRequest
    end
  end

end

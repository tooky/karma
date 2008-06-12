class Sessions < Application
  before :authenticate, :only => :create
  def create
    redirect '/'
  end
  
  def destroy
    session[:logged_in] = false
    redirect '/'
  end
end
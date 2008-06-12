class Application < Merb::Controller

  protected
  def authenticate
    authenticated = basic_authentication("Karma Trading Admin") do |username, password|
      session[:logged_in] = Digest::SHA2.hexdigest(password) == Users[username]
    end
    
    basic_authentication.request unless authenticated
  end
  
  def logged_in?
    session[:logged_in]
  end
end
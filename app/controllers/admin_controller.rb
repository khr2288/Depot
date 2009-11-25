class AdminController < ApplicationController
  
  def login
    if request.post? # postback handling - check if its a GET req (from <a href...>) or POST req (from a form)
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        flash[:notice] = nil
        redirect_to(uri || { :action => "index" }) # display requested page or index
      else
        flash.now[:notice] = "Invalid user/password combination" # dont store msg in flash hash; just display
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login" )
  end

  def index
    @total_orders = Order.count
  end

end

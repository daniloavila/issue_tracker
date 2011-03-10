class HomeController < ApplicationController
  
  def index
    @user = User.new
    if params[:name]
      @projects = Project.where(['name like ?', "%#{params[:name]}"]).order('created_at desc').limit(2)
    else
      @projects = Project.all :order => 'created_at desc', :limit => 2
    end
  end

  def login
    user_login = params[:user]
    user = User.find_by_name(user_login[:name])    
    if user.correct_password?(user_login[:password])
        session[:usuario] = user.name 
        respond_to do |format|
          format.html { redirect_to root_url}
          format.xml  { head :ok }
        end
     else
          respond_to do |format|
            format.html { redirect_to root_url, :notice => "Password errado!"}
            format.xml  { head :ok }
          end
        end
    end
  
  def logout
      session[:usuario] = nil unless session[:usuario].blank?
      
      respond_to do |format|
        format.html { redirect_to root_url}
        format.xml  { head :ok }
      end
  end
end

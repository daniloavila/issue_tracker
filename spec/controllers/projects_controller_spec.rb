require 'spec_helper' 

describe ProjectsController do
  
  it 'deveria carregar o form de projeto' do
    get :new
    response.should be_success
    # response.should render_template(:new) 
    # assigns(:project).should_not be_nil
  end
  
  # it 'deveria criar um novo projeto' do 
  #   post :create, :project => {:name => "Nome"} 
  #   assigns(:project).should_not be_nil
  #   response.should redirect_to(:action => :show, :id => assigns(:project).id)
  # end

end
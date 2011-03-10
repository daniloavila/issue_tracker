class IssuesController < ApplicationController
  
  before_filter :usuario_logado?, :only => [:new, :edit, :create, :update, :destroy]
  
  def index
    @issues = Issue.all
    respond_to do |format|
      format.html # index.html.erb 
      format.xml { render :xml => @issues } 
      format.json { render :json => @issues }
    end
  end
  
  def new
    @issue = Issue.new
  end

  def create
    @project = Project.find params[:project_id]
    @issue = Issue.new params[:issue]
    @issue.project = @project
    @issue.user = User.find_by_name(session[:usuario])
    
    if @issue.save
      format.js do
        @issue = Issue.new
        render :partial => 'issues/issues_operations'
      end
      format.html do
        redirect_to({:controller => :projects, :action => :show, :id => @project.id}, {:notice => 'issue was successfully created.'})
      end
    else
      format.js {render :partial => 'issues/issues_operations'}
      format.html {render :template => 'projects/show'}
    end
  end
    
  def show
    @issue = Issue.find(params[:id])
  end
  
  def edit
    @issue = Issue.find(params[:id])
  end
  
  def update
    @issue = Issue.find(params[:id])

    respond_to do |format|
        if @issue.update_attributes(params[:issue])
          format.html { redirect_to(@issue, :notice => "Issue was successfully updated.") }
          format.xml { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @issue.errors, :status => :unprocessable_entity }  
        end
    end    
  end
  
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy
    @project = Project.find params[:project_id]
    
    respond_to do |format|
      format.html{redirect_to(@project, :notice => "Issue was successfully deleted.")}
      format.xml { head :ok }
    end
  end  
  
  private
  
  def usuario_logado?
    if session[:usuario].nil? or session[:usuario].blank?
       respond_to do |format|
        format.html { redirect_to(issues_url,:notice => 'Usuario sem permissao.') }
        format.xml  { head :ok }
      end
    end
  end
end


































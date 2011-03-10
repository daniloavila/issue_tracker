require 'spec_helper'

describe Project do
  
  it 'deveria salvar o projeto' do
    project = Project.new
    project.name = 'projeto'
    project.description = 'description'
    project.save.should be_true
    
    new_project = Project.find_by_name(project.name)
    new_project.should_not be_nil
    new_project.name.should eql project.name
    new_project.description.should eql project.description
  end
  
  it 'deveria nao salvar projeto sem nome' do
    project = Project.new
    project.save.should be_false
    project.should have(1).error_on :name
  end
  
  it 'deveria salvar o projeto sem descricao' do
    project = Project.new
    project.name = 'projeto'
    project.description = nil
    project.save.should be_true
    
    new_project = Project.find_by_name(project.name)
    new_project.should_not be_nil
    new_project.name.should eql project.name
    new_project.description.should be_nil
  end
  
  it 'deveria salvar projeto com usuario' do
    user = User.new
    user.name = 'name'
    user.second_name = 'second name'
    user.password = 'password'
    
    project = Project.new
    project.name = 'projeto'
    project.description = 'description'
    project.user = user    
    project.save.should be_true
    
    new_project = Project.find_by_name(project.name)
    new_project.should_not be_nil
    new_project.user.should_not be_nil
  end
  
end






















require 'spec_helper'

describe Issue do
  
  it 'deveria salvar o issue' do
    issue = Issue.new
    issue.name = 'issue'
    issue.description = 'descripition'
    
    issue.save.should be_true
    
    new_issue = Issue.find_by_name(issue.name)
    new_issue.should_not be_nil
    new_issue.name.should eql issue.name
    new_issue.description.should eql issue.description
  end
  
  it 'deveria nao salvar issue sem nome' do
    issue = Issue.new
    issue.name = nil
    issue.description = 'descripition'
    
    issue.save.should be_false
    
    issue.name = ''
    issue.save.should be_false
  end
  
  it 'deveria nao salvar issue sem descricao' do
    issue = Issue.new
    issue.name = 'name'
    issue.description = nil
    
    issue.save.should be_false
    
    issue.description = ''
    issue.save.should be_false
  end
  
  it 'deveria salvar um issue de um usuario' do
    user = User.new
    user.name = 'danilo'
    user.password = 'password'
    user.save
    
    issue = Issue.new
    issue.name = 'issue'
    issue.description = 'descripition'
    issue.user = user
    
    issue.save.should be_true
    new_issue = Issue.find_by_name issue.name
    new_issue.should_not be_nil
    new_issue.user should_not be_nil
  end
  
  it 'deveria salvar um issue de um projeto' do
    project = Project.new
    project.name = 'projeto'
    project.description = 'descricao'
    
    issue = Issue.new
    issue.name = 'issue'
    issue.description = 'descripition'
    issue.project = project
    
    issue.save.should be_true
    new_issue = Issue.find_by_name issue.name
    new_issue.should_not be_nil
    new_issue.project.should_not be_nil
  end
end































require 'spec_helper'

describe User do
  
  it 'deveria salvar o usuario' do
    user = User.new
    user.name = 'danilo'
    user.second_name = 'avila'
    user.password = 'password'
    
    user.save.should be_true
    
    new_user = User.find_by_name user.name    
    new_user.should_not be_nil
    new_user.name.should eql user.name
    new_user.second_name.should eql user.second_name
    new_user.password.should eql user.password    
    
  end
  
  it 'deveria nao salvar sem nome' do
    user = User.new
    user.name = nil
    user.second_name = 'avila'
    user.password = 'password'
    
    user.save.should be_false
    user.should have(1).error_on :name
  end
  
  it 'deveria nao salvar sem password' do
    user = User.new
    user.name = 'danilo'
    user.second_name = 'avila'
    user.password = nil
    
    user.save.should be_false
    user.should have(1).error_on :password
  end
  
  it 'deveria salvar sem second_name' do
    user = User.new
    user.name = 'danilo'
    user.second_name = nil
    user.password = 'password'
    
    user.save.should be_true
    new_user = User.find_by_name user.name    
    new_user.should_not be_nil
    new_user.second_name.should be_nil
  end
    
  
end
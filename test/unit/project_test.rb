require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  
  test "se o projeto não pode ser salvo sem o nome" do 
    project = Project.new :name => nil 
    assert_equal(project.save, false)	
    assert_equal(project.errors.size, 1)
  end 
end

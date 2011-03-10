class Issue < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  validate :name_validate, :description_validate
  
  private
  
  def name_validate
    errors.add 'name', 'nome deve ser preenchido' if name.blank? or name.nil?
  end

  def description_validate
    errors.add 'description', 'description deve ser preenchido' if description.blank? or description.nil?
  end
  
end

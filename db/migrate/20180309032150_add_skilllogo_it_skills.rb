class AddSkilllogoItSkills < ActiveRecord::Migration
  def change
    add_column :It_Skills, :Skilllogo, Skilllogo:string
  end
end

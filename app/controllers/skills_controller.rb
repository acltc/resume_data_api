class SkillsController < ApplicationController

	def create 
		@skill = Skill.create({:skill_name => params[:skill_name], :student_id => params[:student_id]})
	end

	def update
		@skill = Skill.find(params[:id])
		@skill.update({:skill_name => params[:skill_name]})
	end

	def delete
		@skill = Skill.find(params[:id])
		@skill.destroy
	end


end

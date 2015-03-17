class SkillsController < ApplicationController

	def create 
		@skill = Skill.create({:skill_name => params[:skill_name], :student_id => params[:student_id]})
		@student = @skill.student
		render "students/show"
	end

	def update
		@skill = Skill.find(params[:id])
		@skill.update({:skill_name => params[:skill_name]})
		@student = @skill.student
		render "students/show"
	end

	def delete
		@skill = Skill.find(params[:id])
		@skill.destroy
		@student = @skill.student
		render "students/show"
	end


end

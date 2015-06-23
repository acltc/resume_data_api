class Api::V1::PersonalSkillsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def create
		@student = current_user.student
		student_id = @student.id
		params[:skills].each do |skill|
		  PersonalSkill.create({:skill_name => skill, :student_id => student_id})
		end
		redirect_to "#{api_v1_students_path(student_id).json}"
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

	def show
		@skill = Skill.find(params[:id])
	end


end

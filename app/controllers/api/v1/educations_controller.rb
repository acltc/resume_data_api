class Api::V1::EducationsController < ApplicationController

	def show
		@education = Education.find(params[:id])
	end

	def create
		@education = Education.create({:start_date => params[:start_date], :end_date => params[:end_date], :degree => params[:degree], :university_name => params[:university_name], :student_id => params[:student_id]})
		# id = @education.student.id
		@student = @education.student
		render "students/show"
	end

	def update
		@education = Education.find(params[:id])
		@education.update({:start_date => params[:start_date], :end_date => params[:end_date], :degree => params[:degree], :university_name => params[:university_name]})
		@student = @education.student
		render "students/show"
	end

	def delete
		@education = Education.find(params[:id])
		@student = @education.student
		@education.destroy
		render "students/show"
	end
end
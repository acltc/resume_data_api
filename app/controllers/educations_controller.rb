class EducationsController < ApplicationController

def update
		@education = Education.find(params[:id])
		@education.update({:start_date => params[:start_date], :end_date => params[:end_Date], :degree => params[:degree], :university_name => params[:university_name]})
	end

	def create
		@education = Education.create({:start_date => params[:start_date], :end_date => params[:end_Date], :degree => params[:degree], :university_name => params[:university_name], :student_id => params[:student_id]})
	end

	def delete
		@education = Education.find(params[:id])
		@education.destroy
	end
end
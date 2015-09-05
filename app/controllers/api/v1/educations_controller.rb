class Api::V1::EducationsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def show
		@education = Education.find(params[:id])
	end

	def create
		@student = current_user.student
		student_id = @student.id
		params["_json"].each do |education|
			if education["universityName"] && education["degree"]
				@education = Education.create({:start_date => education["startDate"], :end_date => education["endDate"], :degree => education["degree"], :university_name => education["universityName"], :student_id => student_id})
				education_id = @education.id
				education["highlights"].each do |highlight|
					if highlight["highlight"]
						EducationDetail.create({:education_id => education_id, :detail => highlight["highlight"]})
					end
				end
			end
		end

		current_user.survey_status = 3
		current_user.save

		redirect_to "#{api_v1_students_path}.json"
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
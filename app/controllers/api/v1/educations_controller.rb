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
		redirect_to "#{api_v1_students_path}.json"
	end

  def update
    current_user = Student.find(params[:id])
    db_educations = current_user.educations
    json_educations = params["_json"][0]
    p db_educations
    p json_educations
		# @education.update({:start_date => params[:start_date], :end_date => params[:end_date], :degree => params[:degree], :university_name => params[:university_name]})
		# @student = @education.student
		render "students/show"
	end

	def delete
		@education = Education.find(params[:id])
		@student = @education.student
		@education.destroy
		render "students/show"
	end
end
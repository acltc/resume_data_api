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
    @student = Student.find(params[:id])
    current_user = @student
    db_educations = current_user.educations
    json_educations = params["_json"]
    array_of_id = []
    db_educations.each do |db_education|
      array_of_id << db_education.id
    end
    json_educations.each_with_index do |json_education, index1|
      if !json_education["id"]
        @education = Education.new({
          :degree => json_education["degree"],
          :university_name => json_education["university_name"],
          :start_date => json_education["start_date"],
          :end_date => json_education["end_date"],
          :student_id => @student.id,
        })
        if @education
          @education.save
        end
      elsif array_of_id.include?(json_education["id"])
      end
    end
		# @education.update({:start_date => params[:start_date], :end_date => params[:end_date], :degree => params[:degree], :university_name => params[:university_name]})
		# @student = @education.student
		render "/api/v1/students/show"
	end

	def delete
		@education = Education.find(params[:id])
		@student = @education.student
		@education.destroy
		render "students/show"
	end
end
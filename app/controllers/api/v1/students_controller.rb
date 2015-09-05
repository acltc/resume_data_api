class Api::V1::StudentsController < ApplicationController
    skip_before_filter :verify_authenticity_token

  def index
  	@students = Student.all
  end

  def show  
		@student = Student.find(params[:id])
    	# @educations = @student.educations
    	# @experiences = @student.experiences
    	# @skills = @student.skills
  end

  def create
    user_id = current_user.id
    @student = Student.create({
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :job_title => params[:job_title],
      :email => params[:email],
      :phone_number => params[:phone_number],
      :github => params[:github],
      :blog => params[:blog],
      :twitter => params[:twitter],
      :linkedin => params[:linkedin],
      :address => params[:address],
      :city => params[:city],
      :state => params[:state],
      :user_id => user_id
    })

    current_user.survey_status = 1
    current_user.save

    redirect_to "#{api_v1_student_path(@student.id)}.json"
  end

  def update
    @student = Student.find(params[:id])
	  @student.update({:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :phone_number => params[:phone_number], :linkedin => params[:linkedin], :twitter => params[:twitter], :blog => params[:blog], :online_resume => params[:online_resume], :github => params[:github], :photo => params[:photo], :short_bio => params[:short_bio]})
	render 'show'
	# redirect_to student_path(params[:id])
  end
	
end

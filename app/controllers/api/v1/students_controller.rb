class Api::V1::StudentsController < ApplicationController

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
    @student = Student.create({
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :email => params[:email],
      :phone_number => params[:phone_number],
      :github => params[:github],
      :blog => params[:blog],
      :twitter => params[:twitter],
      :linkedin => params[:linkedin]
    })
    # redirect_to api_v1_student_path(@student.id)
    # redirect_to "api/v1/students/#{@student.id}.json"
    redirect_to "#{api_v1_student_path(@student.id)}.json"
  end

  def update
    @student = Student.find(params[:id])
	@student.update({:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :phone_number => params[:phone_number], :linkedin => params[:linkedin], :twitter => params[:twitter], :blog => params[:blog], :online_resume => params[:online_resume], :github => params[:github], :photo => params[:photo], :short_bio => params[:short_bio]})
	render 'show'
	# redirect_to student_path(params[:id])
  end
	
end

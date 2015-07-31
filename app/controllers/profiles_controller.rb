class ProfilesController < ApplicationController
  include ProfilesHelper
  before_action :authenticate_user!, :only => [:edit]
  

  def edit
    if current_user.student
      @student = current_user.student
      @experiences = @student.experiences
      @educations = @student.educations
      @professional_skills = @student.professional_skills
      @personal_skills = @student.personal_skills
      @references = @student.references
    else
      redirect_to new_personal_information_path
    end
  end

  def show
    @students = Student.all
    # binding.pry
    if users_name(params[:full_name])
      @student = Student.find_by_first_name(users_name(params[:full_name]))
    else
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
    
  end



   


end

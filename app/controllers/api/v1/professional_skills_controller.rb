class Api::V1::ProfessionalSkillsController < ApplicationController
  skip_before_filter :verify_authenticity_token


  def create
    @student = current_user.student
    student_id = @student.id
    params[:skills].each do |skill|
      ProfessionalSkill.create({:student_id => student_id, :skill_name => skill})
    end
    redirect_to "#{api_v1_students_path(student_id)}.json"
  end

end
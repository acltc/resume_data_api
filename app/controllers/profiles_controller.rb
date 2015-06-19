class ProfilesController < ApplicationController
  include ProfilesHelper
  before_action :authenticate_user!, :only => [:edit]
  

  def edit
    if current_user.student
      @student = current_user.student
    else
      redirect_to new_personal_information_path
    end
  end

  def show
    @students = Student.all
    @student = Student.find_by_first_name(users_name(params[:full_name]))
  end

end

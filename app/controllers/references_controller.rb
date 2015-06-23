class ReferencesController < ApplicationController

  def new
  	@student_id = current_user.student.id
  end

end

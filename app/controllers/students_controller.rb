class StudentsController < ApplicationController

<<<<<<< HEAD
  def show
    @student = Student.find(.params[:id])
=======
	def show  
		@student = Student.find(params[:id])
	end

>>>>>>> 397df6e3192d0daf7f76d462ddcf044b816d2f9d
end

class StudentsController < ApplicationController

	def show  
		@student = Student.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])
		@student.update([:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :phone_number => params[:phone_number], ])
	end

end

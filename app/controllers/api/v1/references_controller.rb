class Api::V1::ReferencesController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def show
		@reference = Reference.find(params[:id])
	end
	
	def create
		@student = current_user.student
		@student_id = @student.id
		Reference.create({:student_id => @student_id, :first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :phone_number => params[:phone_number], :company_name => params[:company_name]})
		redirect_to "#{api_v1_student_path(@student_id)}.json"
	end

	def update
		@reference = Reference.find(params[:id])
		@reference.update({:student_id => params[:student_id], :good_word => params[:good_word], :referencer_id => params[:referencer_id]})
		@student = @reference.student
		render "students/show"
	end

	def delete
		@references = Reference.find(params[:id])
		@student = @references.student
		@references.destroy
		render "students/show"
	end

end

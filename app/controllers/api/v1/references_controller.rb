class Api::V1::ReferencesController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def show
		@reference = Reference.find(params[:id])
	end
	
	def create
		@student = current_user.student
		student_id = @student.id
		params["_json"].each do |reference|
		  if reference["firstName"] && reference["lastName"]
		    Reference.create({:student_id => student_id, :first_name => reference["firstName"], :last_name => reference["lastName"], :email => reference["email"], :phone_number => reference["phoneNumber"], :company_name => reference["companyName"]})
		  end
		end
		redirect_to "#{api_v1_student_path(student_id)}.json"
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

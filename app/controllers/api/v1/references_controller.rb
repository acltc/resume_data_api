class ReferencesController < ApplicationController

	def show
		@reference = Reference.find(params[:id])
	end
	
	def create
		@reference = Reference.create({:student_id => params[:student_id], :good_word => params[:good_word], :referencer_id => params[:referencer_id]})
		@student = @reference.student
		render "students/show"

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

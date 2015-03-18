class ReferencesController < ApplicationController

	def show

	end
	
	def create

	end

	def update
    @reference = Reference.find(params[:id])
    @reference.update({:student_id => params[:student_id], :good_word => params[:good_word], :reference_id => params[:reference_id]})
    render 'show'
	end

	def delete
		@references = Reference.find(params[:id])
		@student = @references.student
		@references.destroy
		render "students/show"
	end

end

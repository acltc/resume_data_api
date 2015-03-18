class ReferencesController < ApplicationController

	def show

	end
	
	def create

	end

	def update

	end

	def delete
		@references = Reference.find(params[:id])
		@student = @references.student
		@references.destroy
		render "students/show"
	end

end

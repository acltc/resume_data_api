class ExperienceDetailsController < ApplicationController

	def create
		@experience_detail = ExperienceDetail.create({:experience_id => params[:experience_id], :detail => params[:detail]})
			render "students/show"
	end

	def update
		@experience_detail = ExperienceDetail.find(params[:id])
		@experience_detail.update({:experience_detail => params[:experience_detail]})
			render "students/show"
	end

	def delete
		@experience_detail = ExperienceDetail.find(params[:id])
		@experience_detail.destroy
			render "students/show"
	end
	
end

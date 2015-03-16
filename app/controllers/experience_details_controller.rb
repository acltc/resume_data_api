class ExperienceDetailsController < ApplicationController

	def create
		@experience_detail = ExperienceDetail.create({:detail => params[:detail], :experience_id => params[:experience_id]})
	end

	def update
		@experience_detail = ExperienceDetail.find(params[:id])

		@experience_detail.update({:experience_detail => params[:experience_detail]})
	end

	def delete
		@experience_detail = ExperienceDetail.find(params[:id])
		@experience_detail.destroy
	end
	
end

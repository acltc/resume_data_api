class ExperienceDetailsController < ApplicationController

	def create
		@experience_detail = ExperienceDetail.create({:experience_id => params[:experience_id], :detail => params[:detail]})
		@student = @experience_detail.experience.student
			render "students/show"
	end

	def update
		@experience_detail = ExperienceDetail.find(params[:id])

		@experience_detail.update({:detail => params[:experience_detail]})
		p "that worked!!"
		@student = @experience_detail.experience.student
		render "students/show"
	end

	def delete
		@experience_detail = ExperienceDetail.find(params[:id])
		@student = @experience_detail.experience.student
		@experience_detail.destroy
			render "students/show"
	end
	
end

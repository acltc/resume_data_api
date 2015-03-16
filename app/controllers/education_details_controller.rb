class EducationDetailsController < ApplicationController

	def create
		@education_detail = EducationDetail.create({:detail => params[:detail], :education_id => params[:education_id]})
	end

	def update
		@education_detail = EducationDetail.find(params[:id])
		@education_detail.update({:detail => params[:detail]})
	end

	def delete
		@education_detail = EducationDetail.find(params[:id])
		@education_detail.destroy
	end
	
end

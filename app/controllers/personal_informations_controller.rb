class PersonalInformationsController < ApplicationController
	before_action :authenticate_user!, :only => [:new]
  
  def new

  end
  
end

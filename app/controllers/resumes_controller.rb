class ResumesController < ApplicationController
  before_action :authenticate_user!#, :only => [:leach_template_show]

  def index
    
  end

  def show
    @student = Resume.find(params[:id])
    file = @student.full_name + "-Resume.pdf"

    respond_to do |format|
      format.html
      format.pdf do
        pdf = LeachPdf.new(@student)
        send_data pdf.render, type: 'application/pdf', disposition: "inline"
      end
    end  
  end

  def walsh_template_show
    @student = Student.find(params[:id])
    file = @student.full_name + "-Resume.pdf"

    respond_to do |format|
      format.html
      format.pdf do
        pdf = WalshPdf.new(@student)
        send_data pdf.render, type: 'application/pdf', disposition: "inline"
      end
    end  

  end

  def leach_template_show
# binding.pry #needs to be a student payload
    
    puts 'ENTERING THE LEQCH TEMPLATE CONTROLLER'
    
    student = Resume.find(params[:id])
    # student_id = params[:id]
    # student = Unirest.get("http://localhost:3000/api/v1/students/#{student_id}.json").body
    # p student
    # @student = Student.find(params[:id])
    # @student = Resume.find(params[:id])
    # @student = Resume.new(student) #should be student_user
    puts 'MADE @STUDENT..'
    p @student
    file = @student.first_name + "-Resume.pdf"
    binding.pry

    respond_to do |format|
      format.html
      format.pdf do
        pdf = LeachPdf.new(@student)
        send_data pdf.render, type: 'application/pdf', disposition: "inline"
      end
    end  

  end

  def down_load_pdf
    @student = Resume.find(params[:id])
    file = @student.full_name + "-Resume.pdf"

    respond_to do |format|
      format.html
      format.pdf do
        pdf = WalshPdf.new(@student)
        send_data pdf.render, filename: file, type: 'application/pdf'
      end
    end
  end

end

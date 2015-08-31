class ResumesController < ApplicationController

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
    @student = Resume.find(params[:id])
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
    # binding.pry
    @student = Resume.find(params[:id])
    # file = @student.full_name + "-Resume.pdf"

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

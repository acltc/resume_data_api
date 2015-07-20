require "prawn/measurement_extensions"
require 'prawn/table'

class LeachPdf < Prawn::Document

  def initialize(student)
    super(:left_margin => 40, :right_margin => 90)
    @student = student
    header
    profile
    experience
    education
    skills
    references
  end

  def header
    font_size 10
    # stroke_axis
    bounding_box([0, 725], :width => 535, :height => 75) do
      # stroke_bounds
      text "#{@student.full_name}", size: 30, style: :bold, color: "0C0C0C"

      header_data = [
        ["#{@student.full_address}", {:content => "#{@student.phone_number}", :align => :center }, {:content => "#{@student.email}", :align => :right }] ]

      table(header_data, :width => 530, :cell_style => { :padding => [0, 0, 0, 3], :borders => [], :size => 12, :text_color => "858585", :font_style => :bold })

      title = [["Full Stack Web Developer"]]
      table(title, :position => :center, :cell_style => { :padding => [3, 0, 0, 0], :borders => [], :size => 18, :text_color => "0C0C0C", :font_style => :bold } )
    end
  end

  def profile
    bounding_box([bounds.left, cursor], :width => 535) do
      title = [["Profile"]]
      table(title, :position => :left, :cell_style => { :padding => [5, 0, 0, 0], :borders => [], :size => 16, :text_color => "858585", :font_style => :bold } )
      
       text "#{@student.short_bio}", :align => :justify
     end
  end

  def experience
    bounding_box([bounds.left, cursor], :width => 535) do
      title = [["Experience"]]
      table(title, :position => :left, :cell_style => { :padding => [5, 0, 0, 0], :borders => [], :size => 16, :text_color => "858585", :font_style => :bold } )

      @student.experiences.each do |experience|
        move_down(5)
        text "#{experience["job_title"]}, #{experience["company_name"]} -- #{convert_to_year(experience["start_date"])} - #{convert_to_year(experience["end_date"])}", :style => :bold
        experience["details"].each do |detail|

          table([[{:content => "\u2022", :padding => [0, 0, 0, 0], :borders => [], :align => :center},
                  {:content => "#{detail["detail"]}", :padding => [0, 0, 0, 0], :borders => [], :align => :justify} ]])
        end
      end
    end
  end

  def education
    bounding_box([bounds.left, cursor], :width => 535) do
      title = [["Education"]]
      table(title, :position => :left, :cell_style => { :padding => [5, 0, 0, 0], :borders => [], :size => 16, :text_color => "858585", :font_style => :bold } )
      @student.educations.each do |education|
        move_down(5)
        text "#{education["university_name"]}, #{education["degree"]} -- #{convert_to_year(education["start_date"])} - #{convert_to_year(education["end_date"])}", :style => :bold
        education["details"].each do |detail|

          table([[{:content => "\u2022", :padding => [0, 0, 0, 0], :borders => [], :align => :center},
                  {:content => "#{detail["detail"]}", :padding => [0, 0, 0, 0], :borders => [], :align => :justify} ]])
        end
      end
    end
  end

  def skills
    bounding_box([bounds.left, cursor], :width => 535) do
      title = [["Skills"]]
      table(title, :position => :left, :cell_style => { :padding => [5, 0, 0, 0], :borders => [], :size => 16, :text_color => "858585", :font_style => :bold } )
      @student.skills.each do |skill|
        table([[{:content => "\u2022", :padding => [0, 0, 0, 0], :borders => [], :align => :center},
                {:content => "#{skill["skill_name"]}", :padding => [0, 0, 0, 0], :borders => [], :align => :justify} ]])
      end
    end
  end

  def references
    bounding_box([bounds.left, bounds.bottom + 10], :width  => bounds.width) do
      data = [["References upon request"]]
      table(data, :position => :center, :cell_style => { :borders => [] } )
    end
  end
  private

    def convert_to_year(date)
      if date
        date[/\d{4}/]
      else
        nil
      end
    end

    def sub_table(array)
      new_sub_table = []
      if array.size == 0
        new_sub_table << Array.new(1, "")
      else
        array.each do |array_elements|
          new_sub_table << Array.new(1, array_elements["detail"])
        end
      end
      return new_sub_table
    end

end
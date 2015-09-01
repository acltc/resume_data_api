class Resume #< ActiveRecord::Base
  # respond_to :json

  # belongs_to :student
  # belongs_to :user

  attr_reader :id, :first_name, :last_name, :email, :phone_number, :linkedin, :twitter, :blog, :online_resume, :github, :address, :city, :state, :apart, :photo, :short_bio, :skills, :educations, :experiences, :references

  def initialize(args)
    @id             = args["id"]
    @first_name     = args["first_name"]
    @last_name      = args["last_name"]
    @email          = args["email"]
    @phone_number   = args["phone_number"]
    @linkedin       = args["linkedin"]
    @twitter        = args["twitter"]
    @blog           = args["blog"]
    @online_resume  = args["online_resume"]
    @github         = args["github"]
    @address        = args["address"]
    @city           = args["city"]
    @state          = args["state"]
    @apart          = args["appt_number"]
    @photo          = args["photo"]
    @short_bio      = args["short_bio"]
    @skills         = args["skills"]
    @educations     = args["educations"]
    @experiences    = args["experiences"]
    @references     = args["references"]
  end

  def full_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
# TODO = ADD ZIP CODE
  def full_address
    return "#{@address}, #{@apart} #{@city} #{@state}, 60611"
  end

  def self.find(id)
    student = Student.find(id)
    all_student_information = {
      'id' => student.id,
      'first_name' => student.first_name,
      'last_name' => student.last_name,
      'address' => student.address,
      'city' => student.city,
      'state' => student.state,
      'appt_number' => student.appt_number,
      'job_title' => student.job_title,
      'github' => student.github,
      'online_resume' => student.online_resume,
      'blog' => student.blog,
      'twitter' => student.twitter,
      'linkedin' => student.linkedin,
      'phone_number' => student.phone_number,
      'email' => student.email,
      'short_bio' => student.short_bio,
      'experiences' => student.experiences,
      'educations' => student.educations,
      'skills' => student.personal_skills
    }
    Resume.new(all_student_information)
  end

  def self.all
    all_students_array = Unirest.get("http://localhost:3000/api/v1/students.json").body["students"]
    @students = []
    all_students_array.each do |student_hash|
      @students << Resume.new(student_hash)
    end
    @students
  end
end
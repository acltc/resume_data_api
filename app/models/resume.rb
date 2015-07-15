class Resume
  attr_reader :id, :first_name, :last_name, :email, :phone_number, :linkedin, :twitter, :blog, :online_resume, :github, :photo, :short_bio, :skills, :educations, :experiences, :address, :city, :state, :apart

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
    @photo          = args["photo"]
    @short_bio      = args["short_bio"]
    @skills         = args["skills"]
    @educations     = args["educations"]
    @experiences    = args["experiences"]
    @address        = args["address"]
    @city           = args["city"]
    @state          = args["state"]
    @apart          = args["appt_number"]
  end

  def full_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
# TODO = ADD ZIP CODE
  def full_address
    return "#{@address}, #{@apart} #{@city} #{@state}, 60611"
  end

  def self.find(id)
    @student = Unirest.get("http://localhost:3000/api/v1/students/#{id}.json").body
    binding.pry
    Resume.new(student)
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
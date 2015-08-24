class Resume
  # respond_to :json

  # belongs_to :student
  attr_reader :id, :first_name, :last_name, :email, :phone_number, :linkedin, :twitter, :blog, :online_resume, :github, :address, :city, :state, :apart, :photo, :short_bio, :skills, :educations, :experiences, :references

  def initialize(args)
    # student = {"id" => 1, "first_name" => "Troy", "last_name" => "Leach", "email" => "troy@outlook.com", "phone_number" => "888-999-0000", "linkedin" => "Whatever", "blog" => nil, "online_resume" => nil, "github" => nil, "address" => nil, "city" => nil, "state" => nil, "appt_number" => "9", "photo" => nil, "short_bio" => nil, "skills" =>}
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
    puts 'ENTERING THE SELF . FIND IN MODEL'
    p id
    # binding.pry
    # student = Student.find_by(id)
    # student = Api::getInstance()->fetchPost(id)
    uri = "api/v1/students/#{id}.json"
    p uri
    # student = Unirest.get("http://localhost:3000/api/v1/students/#{id}.json").body
    # binding.pry
    p student
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
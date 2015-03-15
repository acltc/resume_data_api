json.id @student.id
json.first_name @student.first_name
json.last_name @student.last_name
json.email @student.email
json.phone_number @student.phone_number
json.linkedin @student.linkedin
json.twitter @student.twitter
json.blog @student.blog
json.online_resume @student.online_resume
json.github @student.github
json.photo @student.photo
json.short_bio @student.short_bio


json.skills @skills do |skill|
  json.skill_name
end

json.education @educations do |education|
  json.degree
  json.university_name
  json.start_date
  json.end_date
end


json.experiences @experiences do |experience|
  json.job_title 
  json.company_name
  json.start_date 
  json.end_date 
end


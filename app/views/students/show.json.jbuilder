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

json.skills @student.skills do |skill| 
json.id skill.id
  json.skill_name skill.skill_name
end

json.educations @student.educations do |education|
	json.id education.id
  json.degrees education.degree
  json.university_name education.university_name
  json.start_date education.start_date
  json.end_date education.end_date
end


json.experiences @student.experiences do |experience|
	json.id experience.id
  json.job_title experience.job_title 
  json.company_name experience.company_name
  json.start_date experience.start_date 
  json.end_date experience.end_date
end


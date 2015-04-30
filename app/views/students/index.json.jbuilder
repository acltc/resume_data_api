json.students @students.each do |student|
  json.id student.id
  json.first_name student.first_name
  json.last_name student.last_name
  json.email student.email
  json.phone_number student.phone_number
  json.linkedin student.linkedin
  json.twitter student.twitter
  json.blog student.blog
  json.online_resume student.online_resume
  json.github student.github
  json.photo student.photo
  json.short_bio student.short_bio

  json.skills student.skills do |skill| 
    json.id skill.id
    json.skill_name skill.skill_name
  end

  json.educations student.educations do |education|
  	json.id education.id
    json.degrees education.degree
    json.university_name education.university_name
    json.start_date education.start_date
    json.end_date education.end_date
    json.details education.education_details do |education_detail|
      json.id education_detail.id
      json.detail education_detail.detail
    end
  end

  json.experiences student.experiences do |experience|
  	json.id experience.id
    json.job_title experience.job_title 
    json.company_name experience.company_name
    json.start_date experience.start_date 
    json.end_date experience.end_date
    json.details experience.experience_details do |experience_detail|
      json.id experience_detail.id
      json.detail experience_detail.detail
    end
  end

  json.references student.references do |reference|
  json.id reference.id
  json.student_id reference.student_id
  json.refrencer_id reference.referencer_id
  json.text reference.good_word
  end
end
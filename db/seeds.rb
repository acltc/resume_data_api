Education.create!([
  {start_date: "2015-03-12", end_date: "2015-03-15", degree: "IS", university_name: "FSU", student_id: 3},
  {start_date: "2015-03-11", end_date: "2015-03-15", degree: "BA", university_name: "MIT", student_id: 2},
  {start_date: "2015-03-13", end_date: "2015-03-15", degree: "BS ", university_name: "Princeton", student_id: 1},
  {start_date: "2015-03-13", end_date: "2015-03-15", degree: "PHD", university_name: "Havard", student_id: 4}
])
EducationDetail.create!([
  {detail: "Helped troubleshoot printers", education_id: 7},
  {detail: "Sold grilled cheeses on the great lawn\n", education_id: 7},
  {detail: "Cheated on SAT's", education_id: 8},
  {detail: "Helped troubleshoot printers", education_id: 8},
  {detail: "Sold grilled cheeses on the great lawn\n", education_id: 9},
  {detail: "Cheated on SAT's", education_id: 9},
  {detail: "Helped troubleshoot printers", education_id: 10},
  {detail: "Sold grilled cheeses on the great lawn\n", education_id: 10},
  {detail: "Cheated on SAT's", education_id: 10}
])
Experience.create!([
  {start_date: "2011-04-14", end_date: "2011-05-15", job_title: "admin", company_name: "FB", student_id: 1},
  {start_date: "2015-03-11", end_date: "2015-03-15", job_title: "secretary", company_name: "AOL", student_id: 2}
])
ExperienceDetail.create!([
  {detail: "Worked with . . . .", experience_id: nil},
  {detail: "Worked with . . . .", experience_id: nil},
  {detail: "Worked with . . . .", experience_id: 2},
  {detail: "Ran Spelling Bee", experience_id: 1}
])
Skill.create!([
  {skill_name: "Hacker", student_id: 1},
  {skill_name: "Developer", student_id: 2},
  {skill_name: "Programming", student_id: 3},
  {skill_name: "Waitor", student_id: 4}
])
Student.create!([
  {first_name: "Brent", last_name: "Morris", email: "inkrypto@gmail.com", phone_number: "99999999", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "github", photo: nil, short_bio: nil},
  {first_name: "Shlomo", last_name: "Twerski", email: "ystwerski@gmail.com", phone_number: "847-679-3052", linkedin: "yes", twitter: "no", blog: "https://ystwerski.wordpress.com/", online_resume: "yes", github: "https://github.com/ystwerski", photo: "", short_bio: ""},
  {first_name: "Jeff", last_name: "Carpenter", email: "jeff@gmail.com", phone_number: "787879789", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "github/jeff", photo: nil, short_bio: nil},
  {first_name: "Brian", last_name: "Vogelman", email: "brian@gmeila.com", phone_number: "67678997", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "git", photo: nil, short_bio: nil},
  {first_name: "Brian", last_name: "Vogelman", email: "brian@gmeila.com", phone_number: "67678997", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "git", photo: nil, short_bio: nil}
])

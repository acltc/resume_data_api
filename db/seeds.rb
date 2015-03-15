Education.create!([
  {start_date: nil, end_date: nil, degree: "IS", university_name: "FSU", student_id: nil},
  {start_date: nil, end_date: nil, degree: "BA", university_name: "MIT", student_id: nil},
  {start_date: nil, end_date: nil, degree: "BS ", university_name: "Princeton", student_id: nil}
])
EducationDetail.create!([
  {detail: "Helped troubleshoot printers", education_id: nil},
  {detail: "Sold grilled cheeses on the great lawn\n", education_id: nil},
  {detail: "Cheated on SAT's", education_id: nil}
])
ExperienceDetail.create!([
  {detail: "Worked with . . . .", experience_id: nil}
])
Skill.create!([
  {skill_name: "Hacker", student_id: nil},
  {skill_name: "Developer", student_id: nil},
  {skill_name: "Programming", student_id: nil}
])
Student.create!([
  {first_name: "Brent", last_name: "Morris", email: "inkrypto@gmail.com", phone_number: "99999999", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "github", photo: nil, short_bio: nil},
  {first_name: "Sholmo", last_name: "Twerski", email: "sholmo@acltc.com", phone_number: "768787878", linkedin: "", twitter: nil, blog: nil, online_resume: "yes", github: "github.com", photo: nil, short_bio: nil},
  {first_name: "Jeff", last_name: "Carpenter", email: "jeff@gmail.com", phone_number: "787879789", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "github/jeff", photo: nil, short_bio: nil},
  {first_name: "Brian", last_name: "Vogelman", email: "brian@gmeila.com", phone_number: "67678997", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "git", photo: nil, short_bio: nil}
])

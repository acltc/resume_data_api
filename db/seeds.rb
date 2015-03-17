Education.create!([
  {start_date: nil, end_date: nil, degree: "IS", university_name: "FSU", student_id: 1},
  {start_date: nil, end_date: nil, degree: "BA", university_name: "MIT", student_id: 2},
  {start_date: nil, end_date: nil, degree: "BS ", university_name: "Princeton", student_id: 3},
  {start_date: "2015-03-12", end_date: "2015-03-15", degree: "IS", university_name: "FSU", student_id: 3},
  {start_date: "2015-03-11", end_date: "2015-03-15", degree: "BA", university_name: "MIT", student_id: 2},
  {start_date: "2015-03-13", end_date: "2015-03-15", degree: "BS ", university_name: "Princeton", student_id: 1},
  {start_date: "2015-03-13", end_date: "2015-03-15", degree: "PHD", university_name: "Havard", student_id: 4},
  {start_date: "2015-03-12", end_date: "2015-03-15", degree: "IS", university_name: "FSU", student_id: 3},
  {start_date: "2015-03-11", end_date: "2015-03-15", degree: "BA", university_name: "MIT", student_id: 2},
  {start_date: "2015-03-13", end_date: "2015-03-15", degree: "BS ", university_name: "Princeton", student_id: 1},
  {start_date: "2015-03-13", end_date: "2015-03-15", degree: "PHD", university_name: "Havard", student_id: 4}
])
EducationDetail.create!([
  {detail: "Helped troubleshoot printers", education_id: nil},
  {detail: "Sold grilled cheeses on the great lawn\n", education_id: nil},
  {detail: "Cheated on SAT's", education_id: nil},
  {detail: "Helped troubleshoot printers", education_id: 7},
  {detail: "Sold grilled cheeses on the great lawn\n", education_id: 7},
  {detail: "Cheated on SAT's", education_id: 8},
  {detail: "Helped troubleshoot printers", education_id: 8},
  {detail: "Sold grilled cheeses on the great lawn\n", education_id: 9},
  {detail: "Cheated on SAT's", education_id: 9},
  {detail: "Helped troubleshoot printers", education_id: 10},
  {detail: "Sold grilled cheeses on the great lawn\n", education_id: 10},
  {detail: "Cheated on SAT's", education_id: 10},
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
  {start_date: "2015-03-11", end_date: "2015-03-15", job_title: "secretary", company_name: "AOL", student_id: 2},
  {start_date: "2011-04-14", end_date: "2011-05-15", job_title: "admin", company_name: "FB", student_id: 1},
  {start_date: "2015-03-11", end_date: "2015-03-15", job_title: "secretary", company_name: "AOL", student_id: 2}
])
ExperienceDetail.create!([
  {detail: "Worked with . . . .", experience_id: 1},
  {detail: "Worked with . . . .", experience_id: nil},
  {detail: "Worked with . . . .", experience_id: nil},
  {detail: "Worked with . . . .", experience_id: 2},
  {detail: "Ran Spelling Bee", experience_id: 1},
  {detail: "Worked with . . . .", experience_id: nil},
  {detail: "Worked with . . . .", experience_id: nil},
  {detail: "Worked with . . . .", experience_id: 2},
  {detail: "Ran Spelling Bee", experience_id: 1}
])
Skill.create!([
  {skill_name: "Hacker", student_id: 1},
  {skill_name: "Developer", student_id: 2},
  {skill_name: "Programming", student_id: 3},
  {skill_name: "Hacker", student_id: 1},
  {skill_name: "Developer", student_id: 2},
  {skill_name: "Programming", student_id: 3},
  {skill_name: "Waitor", student_id: 4},
  {skill_name: "Hacker", student_id: 1},
  {skill_name: "Developer", student_id: 2},
  {skill_name: "Programming", student_id: 3},
  {skill_name: "Waitor", student_id: 4}
])
Student.create!([
  {first_name: "Brent", last_name: "Morris", email: "inkrypto@gmail.com", phone_number: "99999999", linkedin: "https://www.linkedin.com/in/inkrypto", twitter: "577626050299056128", blog: "http://darkstarud.com/", online_resume: "yes", github: "https://github.com/inkrypto", photo: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/1/005/010/292/36d9758.jpg", short_bio: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. "},
  {first_name: "Sholmo", last_name: "Twerski", email: "sholmo@acltc.com", phone_number: "768787878", linkedin: "", twitter: nil, blog: nil, online_resume: "yes", github: "https://github.com/ystwerski", photo: nil, short_bio: nil},
  {first_name: "Jeff", last_name: "Carpenter", email: "jeff@gmail.com", phone_number: "787879789", linkedin: "https://www.linkedin.com/pub/jeff-carpenter/6/42/966", twitter: "577645286807486464", blog: "http://germancabezas.com/category/blog/", online_resume: "yes", github: "https://github.com/jdoranpeters", photo: "https://media.licdn.com/mpr/mpr/shrink_200_200/p/8/005/05a/148/09fca51.jpg", short_bio: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium."},
  {first_name: "Brian", last_name: "Vogelman", email: "brian@gmeila.com", phone_number: "67678997", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "https://github.com/brianvogelman", photo: nil, short_bio: nil},
  {first_name: "Brent", last_name: "Morris", email: "inkrypto@gmail.com", phone_number: "99999999", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "github", photo: nil, short_bio: nil},
  {first_name: "Shlomo", last_name: "Twerski", email: "ystwerski@gmail.com", phone_number: "847-679-3052", linkedin: "yes", twitter: "no", blog: "https://ystwerski.wordpress.com/", online_resume: "yes", github: "https://github.com/ystwerski", photo: "", short_bio: ""},
  {first_name: "Jeff", last_name: "Carpenter", email: "jeff@gmail.com", phone_number: "787879789", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "github/jeff", photo: nil, short_bio: nil},
  {first_name: "Brian", last_name: "Vogelman", email: "brian@gmeila.com", phone_number: "67678997", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "git", photo: nil, short_bio: nil},
  {first_name: "Brian", last_name: "Vogelman", email: "brian@gmeila.com", phone_number: "67678997", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "git", photo: nil, short_bio: nil},
  {first_name: "Brent", last_name: "Morris", email: "inkrypto@gmail.com", phone_number: "99999999", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "github", photo: nil, short_bio: nil},
  {first_name: "Shlomo", last_name: "Twerski", email: "ystwerski@gmail.com", phone_number: "847-679-3052", linkedin: "yes", twitter: "no", blog: "https://ystwerski.wordpress.com/", online_resume: "yes", github: "https://github.com/ystwerski", photo: "", short_bio: ""},
  {first_name: "Jeff", last_name: "Carpenter", email: "jeff@gmail.com", phone_number: "787879789", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "github/jeff", photo: nil, short_bio: nil},
  {first_name: "Brian", last_name: "Vogelman", email: "brian@gmeila.com", phone_number: "67678997", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "git", photo: nil, short_bio: nil},
  {first_name: "Brian", last_name: "Vogelman", email: "brian@gmeila.com", phone_number: "67678997", linkedin: nil, twitter: nil, blog: nil, online_resume: "yes", github: "git", photo: nil, short_bio: nil}
])

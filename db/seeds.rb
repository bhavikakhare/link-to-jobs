# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(
    email: "jill@email.com",
    password: "password",
    first_name: "Jill",
    last_name: "Johnson",
    is_recruiter: false,
    address: '123 Sesame Street',
    highest_degree: 'Bachelor\'s',
    highest_degree_school: 'UoM',
    phone_number: '901-323-2392'
)

user2 = User.create!(
    email: "bhavika@email.com",
    password: "password",
    first_name: "Bhavika",
    last_name: "Khare",
    is_recruiter: true
)

user3 = User.create!(
    email: "jerica@email.com",
    password: "password",
    first_name: "Jerica",
    last_name: "Chambers",
    is_recruiter: false,
    address: '123 Sesame Street',
    highest_degree: 'Master\'s',
    highest_degree_school: 'CBU',
    phone_number: '901-555-5555'
)

user4 = User.create!(
    email: "jibran@email.com",
    password: "password",
    first_name: "Jibran",
    last_name: "Abbasi",
    is_recruiter: true
)

company1 = Company.create!(
    name:"Apple",
    email:"apple@email.com",
    phone_number:11111111,
    avg_rating:5.0,
    sum_ratings:nil,
    count_ratings:nil,
    size:"small",
    description:"We sell over-priced sleek phones that all look the same.",
    address:"California, USA",
    year_established:1997,
    recruiter: user2
)

company2 = Company.create!(
    name:"Ball",
    email:"ball@email.com",
    phone_number:11222211,
    avg_rating:4.0,
    sum_ratings:52,
    count_ratings:13,
    size:"medium",
    description:"We sell bouncey rubber balls in bulk.",
    address:"Bouncey Ball Factory in Memphis",
    year_established:1900,
    recruiter: user2
)

company3 = Company.create!(
    name:"Calvin Klein",
    email:"ck@email.com",
    phone_number:11233211,
    avg_rating:3.5,
    sum_ratings:nil,
    count_ratings:nil,
    size:"big",
    description:"We sell nice clothes.",
    address:"CK head-quarters in Memphis",
    year_established:2003,
    recruiter: user4
)

posting1 = JobPosting.create!(
    title: 'Video Editor',
    summary: 'a video editor is needed to animate frames for the company ad campaign',
    experience_required: 1,
    is_closed: false,
    company: company1,
    tag_list: 'Law'
)

posting2 = JobPosting.create!(
    title: 'Java Programmer 1',
    summary: 'a java programmer is needed to test bugs in our software',
    experience_required: 2,
    is_closed: false,
    company: company1,
    tag_list: 'Interior Design'
)

posting3 = JobPosting.create!(
    title: 'Host',
    summary: 'a host is needed to place customers at appropriate tables',
    experience_required: 3,
    is_closed: false,
    company: company3,
    tag_list: 'Fashion Design')

posting4 = JobPosting.create!(
    title: 'Jr. Software Developer',
    summary: 'a software developer is need to build web apps in Ruby on Rails',
    experience_required: 1,
    is_closed: false,
    company: company1,
    tag_list: 'Computer Science')
    
posting5 = JobPosting.create!(
    title: 'Video Editor',
    summary: 'Video Editor required to edit heavy metal music videos',
    experience_required: 7,
    is_closed: false,
    company: company2,
    tag_list: 'Film/Video')
    
posting6 = JobPosting.create!(
    title: 'Kitchen Worker',
    summary: 'Expeirience worker required to organize food on plates in fine dining restaurant',
    experience_required: 2,
    is_closed: false,
    company: company3,
    tag_list: 'Food Industry')
    
posting7 = JobPosting.create!(
    title: 'Accountant',
    summary: 'Experienced accountant required for preparing tax returns',
    experience_required: 4,
    is_closed: false,
    company: company1,
    tag_list: 'Business')
    
posting8 = JobPosting.create!(
    title: 'Data Analyst',
    summary: 'Recent graduate in computer science required for data analytics',
    experience_required: 1,
    is_closed: false,
    company: company2,
    tag_list: 'Business')

posting9 = JobPosting.create!(
    title: 'Minister of Music',
    summary: 'Need a Minister of Music to coordinate, rehearse, and direct all choirs of our church',
    experience_required: 3,
    is_closed: false,
    company: company3,
    tag_list: 'Music')

posting10 = JobPosting.create!(
    title: 'Firefighter',
    summary: 'Setting up a new fire department and need someone to lead the team',
    experience_required: 6,
    is_closed: false,
    company: company1,
    tag_list: 'Public Service')
    
posting11 = JobPosting.create!(
    title: 'Police Officer',
    summary: 'Need to hire a police officer as a security consultant',
    experience_required: 2,
    is_closed: false,
    company: company2,
    tag_list: 'Public Service')

posting12 = JobPosting.create!(
    title: 'Cashier',
    summary: 'A quick and honest cashier required who can work night shifts',
    experience_required: 1,
    is_closed: false,
    company: company3,
    tag_list: 'Computer Science')

posting13 = JobPosting.create!(
    title: 'IT Technician',
    summary: 'Need a technician to manage IT infrastructure',
    experience_required: 2,
    is_closed: false,
    company: company1,
    tag_list: 'Computer Science')
    
posting14 = JobPosting.create!(
    title: 'Office Manager',
    summary: 'Manager required to manage a team of administrative or support staff',
    experience_required: 8,
    is_closed: false,
    company: company2,
    tag_list: 'Business')

question1 = Question.create!(
    question: 'Link to Resume',
    job_posting: posting1
)

question2 = Question.create!(
    question: 'Work Reference',
    job_posting: posting1
)

question3 = Question.create!(
    question: 'Programming Experience',
    job_posting: posting2
 )

posting1.users << [user1, user3]
posting2.users << [user1]
posting3.users << [user3]
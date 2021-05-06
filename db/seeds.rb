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
    name:"CK",
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
    tag_list: 'Fashion Design',
)

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

job_application_1 = JobApplication.create!(
    job_posting: posting1,
    user: user1,
)
job_application_2 = JobApplication.create!(
    job_posting: posting1,
    user: user3,
)
posting2.users << [user1]
posting3.users << [user3]

answer1 = Answer.create!(
  answer: 'abc.d/efg/hi',
  question: question1,
  job_application: job_application_1,
)

answer2 = Answer.create!(
  answer: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam rutrum est vitae aliquam dictum. Etiam bibendum ipsum quis facilisis congue. Maecenas vel convallis urna. Ut non commodo libero. Donec condimentum at ipsum ut cursus. Aliquam gravida, augue vitae rhoncus feugiat, eros massa volutpat massa, at posuere odio ex nec est. Etiam nec arcu facilisis, pulvinar lacus non, dapibus sapien. Proin in luctus nibh, at pharetra urna. Morbi ante eros, lacinia sit amet rhoncus id, malesuada eget eros. Ut nec erat nec est cursus pellentesque. Vivamus malesuada purus faucibus lectus efficitur, eget eleifend nibh mattis. Fusce mattis efficitur risus, ac varius velit venenatis eget. Phasellus est metus, molestie nec malesuada sed, pellentesque sed diam. Proin malesuada non ante sed finibus. Nulla tristique vel enim sit amet tempus. Integer sed nunc ut massa aliquet venenatis.',
  question: question2,
  job_application: job_application_2,
)

answer3 = Answer.create!(
  answer: '0123456789',
  question: question2,
  job_application: job_application_2,
)
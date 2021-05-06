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
    avg_rating:3.0,
    sum_ratings:0,
    count_ratings:2,
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
    sum_ratings:0,
    count_ratings:0,
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
    tag_list: 'Fashion Design'
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

review1 = Review.create!(
    rating_5: 1.0,
    review_text: 'This company sucks',
    anonymous: true,
    company: company1,
    applicant: user1
)

review2 = Review.create!(
    rating_5: 5.0,
    review_text: 'Did you ever hear the tragedy of Darth Plagueis The Wise? I thought not. It’s not a story the Jedi would tell you. It’s a Sith legend. Darth Plagueis was a Dark Lord of the Sith, so powerful and so wise he could use the Force to influence the midichlorians to create life… He had such a knowledge of the dark side that he could even keep the ones he cared about from dying. The dark side of the Force is a pathway to many abilities some consider to be unnatural. He became so powerful… the only thing he was afraid of was losing his power, which eventually, of course, he did. Unfortunately, he taught his apprentice everything he knew, then his apprentice killed him in his sleep. Ironic. He could save others from death, but not himself.',
    anonymous: false,
    company: company1,
    applicant: user3
)

posting1.users << [user1, user3]
posting2.users << [user1]
posting3.users << [user3]
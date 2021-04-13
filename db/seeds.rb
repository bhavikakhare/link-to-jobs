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
  first_name: "jill",
  last_name: "jill",
  is_recruiter: false
)

user2 = User.create!(
  email: "bhavika@email.com",
  password: "password",
  first_name: "bhavika",
  last_name: "bhavika",
  is_recruiter: true
)

JobPosting.create!(
    job_category: 'Media',
    title: 'Video Editor',
    summary: 'a video editor is needed to animate frames for the company ad campaign',
    experience_required: 1,
    is_closed: false
)

JobPosting.create!(
    job_category: 'Software',
    title: 'Java Programmer 1',
    summary: 'a java programmer is needed to test bugs in our software',
    experience_required: 2,
    is_closed: false
)

JobPosting.create!(
    job_category: 'Food Service',
    title: 'Host',
    summary: 'a host is needed to place customers at appropriate tables',
    experience_required: 3,
    is_closed: false
)

company1 = Company.create(
    name:"Apple",
    email:"apple@email.com",
    phone_number:11111111,
    avg_rating:5.0,
    sum_ratings:nil,
    count_ratings:nil,
    size:"small",
    description:"We sell over-priced sleek phones that all look the same.",
    address:"@home",
    year_established:1997,
    recruiter: user2,
)

company2 = Company.create(
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
    recruiter: user2,
)

company3 = Company.create(
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
    recruiter: user2,
)

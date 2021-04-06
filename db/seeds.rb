# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
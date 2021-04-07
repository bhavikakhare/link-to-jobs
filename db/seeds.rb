# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
)

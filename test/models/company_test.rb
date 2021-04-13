# == Schema Information
#
# Table name: companies
#
#  id               :bigint           not null, primary key
#  address          :string
#  avg_rating       :decimal(, )
#  count_ratings    :integer
#  description      :text
#  email            :string
#  name             :string
#  phone_number     :integer
#  size             :string
#  sum_ratings      :bigint
#  year_established :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  recruiter_id     :bigint
#
# Indexes
#
#  index_companies_on_recruiter_id  (recruiter_id)
#
# Foreign Keys
#
#  fk_rails_...  (recruiter_id => users.id)
#
require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "fixtures are valid" do
    companies.each do |c|
      assert c.valid?, c.errors.full_messages.inspect
    end
  end

  test "name is present" do
    c = companies(:one)
    c.name = ""
    assert_not c.valid?
  end

  test "size is present" do
    c = companies(:one)
    c.size = nil
    assert_not c.valid?
  end

  test "email is present" do
    c = companies(:one)
    c.email = nil
    assert_not c.valid?
  end

  test "description is present" do
    c = companies(:one)
    c.description = ""
    assert_not c.valid?
  end

  test "name is within length limits" do
    c = companies(:one)
    c.name = "abc defghijklmnopqrstuvwxyz"
    assert_not c.valid?
  end

  test "size is valid" do
    c = companies(:one)
    c.size = "xyz"
    assert_not c.valid?
  end

  test "email is valid" do
    c = companies(:one)
    c.email = "ab c"
    assert_not c.valid?
  end

  test "description is within length limits" do
    c = companies(:one)
    c.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vehicula quis urna non sollicitudin. Cras erat quam, interdum volutpat felis eget, volutpat dictum quam. Sed fringilla blandit libero in efficitur. Phasellus vehicula tempus orci, non dictum urna volutpat finibus. Nunc at vehicula orci. Aliquam ut magna tortor. Aenean imperdiet justo et velit lobortis, in pretium ante mattis. Quisque dapibus quam fringilla mollis lobortis. Phasellus pretium nibh non velit hendrerit malesuada sit."
    assert_not c.valid?
  end

  # numericality tests left

  test "avg_rating is valid" do
    c = companies(:one)
    c.avg_rating = -2
    assert_not c.valid?
  end

  test "year_established is valid" do
    c = companies(:one)
    c.year_established = 2040
    assert_not c.valid?
  end

  test "phone_number is valid" do
    c = companies(:one)
    c.phone_number = 10000000000
    assert_not c.valid?
  end

end

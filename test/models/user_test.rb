# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :string
#  education              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  highest_degree         :string
#  highest_degree_school  :string
#  is_recruiter           :boolean
#  last_name              :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  
  test "fixtures are valid" do    
    users.each do |user|
      assert user.valid?, user.errors.full_messages.inspect
    end  
  end

  test "email_must_be_valid_and_exist" do
    user_one = users(:one)
    user_one.email = nil
    assert_not user_one.valid?
    user_one.email = "this is my email"
    assert_not user_one.valid?
  end

  test "first_name_must_exist" do
    user_one = users(:one)
    user_one.first_name = nil
    assert_not user_one.valid?
  end

  test "last_name_must_exist" do
    user_one = users(:one)
    user_one.last_name = nil
    assert_not user_one.valid?
  end

  test "is_recruiter_must_exist" do
    user_one = users(:one)
    user_one.is_recruiter = nil
    assert_not user_one.valid?
  end

  test "highest_degree_must_be_from_list" do
    user_one = users(:one)
    user_one.highest_degree = "I'm a baby!"
    assert_not user_one.valid?
  end

end


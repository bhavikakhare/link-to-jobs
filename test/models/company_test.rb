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

end

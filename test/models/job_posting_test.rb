# == Schema Information
#
# Table name: job_postings
#
#  id                  :bigint           not null, primary key
#  experience_required :integer
#  is_closed           :boolean
#  summary             :string
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  company_id          :bigint
#
# Indexes
#
#  index_job_postings_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
require "test_helper"

class JobPostingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "fixtures are valid" do
    job_postings.each do |jp|
      assert jp.valid?, jp.errors.full_messages.inspect
    end
  end

  test "title must be present" do
    job_posting = job_postings(:one)
    job_posting.title = ''
    assert_not job_posting.valid?
  end

  test "summary must be present" do
    job_posting = job_postings(:one)
    job_posting.summary = ''
    assert_not job_posting.valid?
  end

  test "experience required must be present" do
    job_posting = job_postings(:one)
    job_posting.experience_required = ''
    assert_not job_posting.valid?
  end

  test "job category tag must be present" do
    job_posting = job_postings(:one)
    job_posting.tag_list = ''
    assert_not job_posting.valid?
  end

  test "job category tag must be from approved list in User model" do
    job_posting = job_postings(:one)
    job_posting.tag_list = 'Jibran'
    assert_not job_posting.valid?
  end

end

# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  question       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  job_posting_id :bigint
#
# Indexes
#
#  index_questions_on_job_posting_id  (job_posting_id)
#
# Foreign Keys
#
#  fk_rails_...  (job_posting_id => job_postings.id)
#
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end


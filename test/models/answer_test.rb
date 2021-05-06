# == Schema Information
#
# Table name: answers
#
#  id                 :bigint           not null, primary key
#  answer             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  job_application_id :bigint
#  question_id        :bigint
#
# Indexes
#
#  index_answers_on_job_application_id  (job_application_id)
#  index_answers_on_question_id         (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (job_application_id => job_applications.id)
#  fk_rails_...  (question_id => questions.id)
#
require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

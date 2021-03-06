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
class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :job_applications, through: :answers

    belongs_to(
        :job_posting,
        class_name: 'JobPosting',
        foreign_key: 'job_posting_id',
        inverse_of: :questions
    )

    validates :question, presence: true

end

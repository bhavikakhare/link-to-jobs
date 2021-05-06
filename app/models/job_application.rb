# == Schema Information
#
# Table name: job_applications
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  job_posting_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_job_applications_on_job_posting_id  (job_posting_id)
#  index_job_applications_on_user_id         (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (job_posting_id => job_postings.id)
#  fk_rails_...  (user_id => users.id)
#
class JobApplication < ApplicationRecord
  belongs_to :job_posting
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :questions, through: :answers

end

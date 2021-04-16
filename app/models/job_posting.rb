# == Schema Information
#
# Table name: job_postings
#
#  id                  :bigint           not null, primary key
#  experience_required :integer
#  is_closed           :boolean
#  job_category        :string
#  summary             :string
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  company_id          :bigint
#  user_id             :bigint
#
# Indexes
#
#  index_job_postings_on_company_id  (company_id)
#  index_job_postings_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
class JobPosting < ApplicationRecord

    has_many :job_applications, dependent: :destroy
    has_many :users, through: :job_applications

    belongs_to(
        :recruiter,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :job_postings
    )

    belongs_to(
        :company,
        class_name: 'Company',
        foreign_key: 'company_id',
        inverse_of: :job_postings
    )

    validates :title, presence: true
    validates :summary, presence: true
    validates :job_category, presence: true
    validates :experience_required, presence: true

end

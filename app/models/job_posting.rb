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
class JobPosting < ApplicationRecord

    has_many :job_applications, dependent: :destroy
    has_many :users, through: :job_applications

    has_many(
        :questions,
        class_name: 'Question',
        foreign_key: 'job_posting_id',
        inverse_of: :job_posting,
        dependent: :destroy
    )
    
    belongs_to(
        :company,
        class_name: 'Company',
        foreign_key: 'company_id',
        inverse_of: :job_postings
    )

    validates :title, presence: true
    validates :summary, presence: true
    validates :experience_required, presence: true
    validates :tag_list, presence: true
    validates :tag_list, inclusion: User::INTEREST_TAGS.map(&:downcase)

    acts_as_taggable_on :tags

end
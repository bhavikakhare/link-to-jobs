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
#
class JobPosting < ApplicationRecord

    validates :title, presence: true
    validates :summary, presence: true
    validates :job_category, presence: true
    validates :experience_required, presence: true
end

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
#  phone_number     :bigint
#  size             :string
#  sum_ratings      :bigint
#  year_established :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  recruiter_id     :bigint
#
# Indexes
#
#  index_companies_on_recruiter_id  (recruiter_id)
#
# Foreign Keys
#
#  fk_rails_...  (recruiter_id => users.id)
#
class Company < ApplicationRecord

    has_many(
        :job_postings,
        class_name: 'JobPosting',
        foreign_key: 'company_id',
        inverse_of: :company,
        dependent: :destroy
    )
    
    belongs_to(
        :recruiter,
        class_name: 'User',
        foreign_key: 'recruiter_id',
        inverse_of: :companies
    )

    has_many(
        :reviews,
        class_name: 'Review',
        foreign_key: 'company_id',
        inverse_of: :company,
        dependent: :destroy
    )

    #validations
    # presence validations 
    validates :name, presence: true
    validates :size, presence: true
    validates :email, presence: true
    validates :description, presence: true
    # numericality validations
    # validate year limits 
    # validate rating & sum_ratings ( between count_ratings & count_ratings*5 ) 
    # validate all rating attributes to be non-negative
    # validate phone number digits
    validates :avg_rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0, allow_nil: true, }
    validates :count_ratings, numericality: { only_integer: true, allow_nil: true, greater_than_or_equal_to: 0 }
    validates :phone_number, numericality: { only_integer: true, allow_nil: true, greater_than_or_equal_to: 1000000, less_than_or_equal_to: 9999999999 }
    validates :sum_ratings, numericality: { only_integer: true, allow_nil: true, greater_than_or_equal_to: 0 }
    validates :year_established, numericality: { only_integer: true, allow_nil: true, less_than_or_equal_to: ->(_company) { Date.current.year }, greater_than_or_equal_to: 1700 }
    # validate email format
    validates :email, format: { with: Devise.email_regexp, message: "invalid email" }
    # validate name & description lengths
    validates :name, length: {minimum: 1, maximum: 25}, allow_blank: true
    validates :description, length: {minimum: 0, maximum: 256}, allow_blank: true
    # validate size inclusion set
    validates :size, inclusion: { in: ['small', 'medium', 'big'] }
    # note: inside actions make sure the create/update actions don't accept any rating parameters from forms or requests since those should be set by our code and not by any single user
end
# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  rating_5    :integer
#  review_text :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_reviews_on_company_id  (company_id)
#  index_reviews_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
class Review < ApplicationRecord
    belongs_to(
        :applicant,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :reviews
    )

    belongs_to(
        :company,
        class_name: 'Company',
        foreign_key: 'company_id',
        inverse_of: :reviews
    )
end

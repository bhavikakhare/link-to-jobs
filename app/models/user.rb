# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :string
#  education              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  highest_degree         :string
#  highest_degree_school  :string
#  is_recruiter           :boolean
#  last_name              :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :is_recruiter, inclusion: { in: [true, false], message: "this field should either be true or false"}
  validates :highest_degree, inclusion: { in: ['Associate',"Bachelor's","Master's","Doctoral"], allow_blank: true}

  INTEREST_TAGS = ['Chocolate', 'Vanilla', 'Strawberry', 'Grapenut', 'Grape']
  acts_as_taggable_on :tags
  

end

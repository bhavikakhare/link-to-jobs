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
#  is_dark_mode           :boolean          default(FALSE)
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
  has_many :job_applications, dependent: :destroy

  has_many(
    :companies,
    class_name: 'Company',
    foreign_key: 'recruiter_id',
    inverse_of: :recruiter,
    dependent: :destroy
  )

  has_many(
    :reviews,
    class_name: 'Review',
    foreign_key: 'review_id',
    inverse_of: :applicant,
    dependent: :destroy
  )

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :is_recruiter, inclusion: { in: [true, false], message: "this field should either be true or false"}
  validates :highest_degree, inclusion: { in: ['Associate',"Bachelor's","Master's","Doctoral"], allow_blank: true}

  INTEREST_TAGS = ['Fashion Design', 'Fashion Merchandising', 'Graphic Arts', 'Interior Design', 'Web Development',
  'Finance', 'Robotics', 'Game Development', 'Film/Video','Food Industry','Public Service', 'Supply Chain', 'Law',
  'Medicine & Health', 'Digital Marketing','Human Resources','App Development','Ethical Hacking','Architecture',
  'Plumbing','Photography','Career Advising', 'Computer Science', 'Business', 'Music']
  acts_as_taggable_on :tags

  validates :tag_list, inclusion: User::INTEREST_TAGS.map(&:downcase)
  
end

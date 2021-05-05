# == Schema Information
#
# Table name: answers
#
#  id         :bigint           not null, primary key
#  answer     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Answer < ApplicationRecord

    validates :answer, presence: true
end

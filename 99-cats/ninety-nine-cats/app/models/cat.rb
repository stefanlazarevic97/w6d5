# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = %w(black brown orange white mixed)
    SEX = %w(M F)

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: { :in => CAT_COLORS }
    validates :sex, inclusion: { :in => SEX }
    validate :birth_date_not_in_future

    def birth_date_not_in_future
        errors.add(:birth_date, "cannot be in the future") if birth_date > Time.now
    end

    def age
        time_ago_in_words(birth_date)
    end
end

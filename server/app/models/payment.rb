class Payment < ApplicationRecord
  belongs_to :user, depenedent: :destroy
  belongs_to :order, dependent: :destroy
end

class Score < ApplicationRecord
  validates_presence_of :value, :author
end

class Score < ApplicationRecord
  validates_presence_of :value, :author

  default_scope { order(value: :desc) }
end

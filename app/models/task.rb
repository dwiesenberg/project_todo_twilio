class Task < ApplicationRecord
  validates :description, length: {minimum: 4}
end

# class Task < ActiveRecord::Base
#   validates :description, length: {minimum: 4}
# end

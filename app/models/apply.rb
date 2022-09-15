class Apply < ApplicationRecord
  belongs_to :geek
  belongs_to :job

  # validates :name, presence: true
  # validates :location, presence: true
  # validates :resume, presence: true
end

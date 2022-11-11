class Job < ApplicationRecord
  belongs_to :company
  has_many :applies

  validates :place, presence: true
  validates :company_id, presence: true
  validates :name, presence: true

  def mark_delete
    self.update(deleted: true)
  end
end

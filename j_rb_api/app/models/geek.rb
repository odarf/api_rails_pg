class Geek < ApplicationRecord
  has_many :applies

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :stack, presence: true
  validates :resume, presence: true

  def mark_delete
    self.update(deleted: true)
  end
end

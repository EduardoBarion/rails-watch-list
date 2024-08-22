class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_error

  before_destroy :check_for_bookmarks

  validates :title, :overview, presence: true

  private

  def check_for_bookmarks
    if bookmarks.exists?
      errors.add(:base, 'Cannot delete movie with associated bookmarks')
      throw(:abort)
    end
  end
end

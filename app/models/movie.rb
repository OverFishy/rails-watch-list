class Movie < ApplicationRecord
  has_many :bookmarks
  before_destroy :check_for_bookmarks

  validates :title, uniqueness: true
  validates :title, presence: true
  validates :overview, presence: true

  private

  def check_for_bookmarks
    if bookmarks.count.positive?
      # errors.add_to_base('cannot delete movie while bookmarks exist')
      raise ActiveRecord::InvalidForeignKey
    end
  end
end

# ARCHIVE

# on line - 2. has_many :bookmarks, :dependent => :restrict_with_error

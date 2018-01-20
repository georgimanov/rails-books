class Book < ActiveRecord::Base

  def self.all_genres
    ['Science fiction','Drama','Action and Adventure','Romance','Mystery','Horror']
  end

  validates :title, :presence => true
  validates :publish_date, :presence => true
  validates :genre, :inclusion => {:in => Book.all_genres}

end
class Movie < Product
  validates :genre, :media, presence: true
end

class Book < Product

  validates :author, length: {minimum: 2}, presence: true
end

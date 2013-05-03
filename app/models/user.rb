class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :surveys
  has_many :votes

  validates :username, :email, :presence => true  
  validates :username, :email, :uniqueness => true
  validates :password, :length => { :minimum => 5}
  before_create :hash_password
  validate :valid_email

  include BCrypt

    def valid_email
    unless email =~ /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
      errors.add(:email, "Not a valid email, son")
    end
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    return nil unless user
    db_password = Password.new(user.password)
    db_password == password ? user : nil  
  end

  private
  def hash_password
    self.password = Password.create(self.password)
  end 
end
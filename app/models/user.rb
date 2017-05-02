class User < ActiveRecord::Base

  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    if happiness > nausea
      return "happy"
    elsif nausea >= happiness
      return "sad"
    end
    # has a method 'mood' that returns 'sad' when the user is more nauseous than happy (FAILED - 9)
    #has a method 'mood' that returns 'happy' when the user is more happy than nauseous (FAILED - 10)
  end
end

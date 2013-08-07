require 'securerandom'

class Url < ActiveRecord::Base

  before_create :generate_unique_short

  def generate_unique_short
    self[:short] = create_short
    until check_unique(self[:short])
      self[:short] = create_short
    end
  end

  def check_unique(short)
    Url.where(short: short).empty? 
  end

  def create_short
    SecureRandom.hex(3) 
  end

  def self.get_short(long_url)
    url = self.find_by(long: long_url) 
    url = self.create(long: long_url) unless url.nil?
    url.short
  end
end

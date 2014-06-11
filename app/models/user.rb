class User < ActiveRecord::Base

  has_many :job_applications
  has_many :goals

  validates(:email,     { :presence     => true })
  validates(:email,    { :uniqueness   => { case_sensitive: false }})

  validates(:name,     { :presence     => true })

  has_secure_password

end

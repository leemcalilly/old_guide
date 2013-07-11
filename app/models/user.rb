class User < ActiveRecord::Base
  rolify
  authenticates_with_sorcery!
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }

  validates :password, :presence => { :on => :create },
                       length:{ in: 4..40 }, if: ->{ crypted_password.blank? }
end

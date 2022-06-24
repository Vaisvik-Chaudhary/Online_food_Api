class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create_commit :create_cart_detail
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
 
  

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  validates :name, presence: true, length: {minimum: 5}, uniqueness: {case_sensitive: false}
  validates :contact_number,presence:true, length: { is: 10 },numericality: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist


  private

    def create_cart_detail
      curent_user=User.find_by(email: self.email)
      p curent_user.id
      x=Cart.new(user_id: curent_user.id)
      p x.save(:validate => false)
    end
end

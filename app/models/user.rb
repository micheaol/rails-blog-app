class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments
  has_many :posts
  has_many :likes
  # validates :name, presence: { message: 'Name must not be blank' }
  # validates_numericality_of :posts_counter, only_integer: true, greater_than_or_equal: 0

   # User::Roles
  # The available roles
  # Roles = [ :admin , :default ]

  # def is?( requested_role )
  #   self.role == requested_role.to_s
  # end

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end

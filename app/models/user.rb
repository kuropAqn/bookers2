class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :profile_image

         has_many :books, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :book_comments, dependent: :destroy
  
         has_one_attached :profile_image
         validates :name, uniqueness: true
         validates :name, length: { minimum: 2 }
         validates :name, length: { maximum: 20 }
         validates :introduction, length: { maximum: 50 }
  
      def get_profile_image
        if profile_image.attached?
           profile_image.variant(resize_to_limit: [100, 100]).processed
        else
          'default-image.jpg'
      end
   end
end

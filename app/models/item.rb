class Item < ApplicationRecord
 belongs_to :genre, optional: true
 has_many :cart_items


 has_one_attached :image
 
  def with_tax_price
    (price * 1.1).floor
  end


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end

class MemberPicture < ActiveRecord::Base
  attr_accessible :create_year, :description, :member_id, :size,
                  :technique, :file,
                  :main_page_type, :main_page_width, :main_page_height,
                  :gallery_type, :gallery_width, :gallery_height
  
  
  #validates :create_year, presence: true
  #validates :description, presence: true
  #validates :member, presence: true
  #validates :size, presence: true
  #validates :technique, presence: true

  mount_uploader :file, MemberPictureUploader
  
  belongs_to :member
  

  def get_orientation
    img = MiniMagick::Image.open(file.path)
    img[:width] < img[:height] ? :portrait : :landscape
  end
  
  def self.main_page_types
    [
      {
        id: 1,
        width: 139,
        height: 194
      }, {
        id: 4,
        width: 107,
        height: 146
      }, {
        id: 2,
        width: 173,
        height: 117
      }, {
        id: 3,
        width: 195,
        height: 141
      }, {
        id: 5,
        width: 166,
        height: 120
      }, {
        id: 6,
        width: 112,
        height: 80
      }, {
        id: 7,
        width: 164,
        height: 118
      }
    ]
  end
  
  def self.gallery_types
    { 
      portrait: [
        {
          id: 1,
          width: 152,
          height: 213
        }
      ],
      landscape: [
        {
          id: 2,
          width: 175,
          height: 132
        }, 
        {
          id: 3,
          width: 175,
          height: 130
        },  
        {
          id: 4,
          width: 169,
          height: 130
        }
      ]
    }
  end
end

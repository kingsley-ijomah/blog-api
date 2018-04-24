class Api::V1::PostResource < JSONAPI::Resource
  attributes :title, :comment, :status, :image, :user_id

  has_many :comments

  before_save do
    @model.user_id = context[:current_user].id if @model.new_record?
    @model.image = base64_decode_image
  end

  def base64_decode_image
    Paperclip.io_adapters.for(@model.image).tap do |img|
      img.original_filename = "file-name.jpg"
    end
  end
end

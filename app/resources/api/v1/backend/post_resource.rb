class Api::V1::Backend::PostResource < JSONAPI::Resource
  attributes :title, :comment, :status, :image, :user_id, :tag_ids

  has_many :post_tags
  has_many :tags, through: :post_tags

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

  def tag_ids=(tag_ids)
    @model.post_tags.destroy_all
    
    tag_ids.each do |tag_id|
      @model.post_tags.build(tag_id: tag_id)
    end unless tag_ids.empty?
  end
end

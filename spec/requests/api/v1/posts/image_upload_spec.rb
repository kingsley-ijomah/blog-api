require 'rails_helper'

RSpec.describe "Api::V1::Posts::ImageUpload", type: :request do
  describe "POST #create with base64 encoded image" do

    context 'with image' do
      let(:base64_image) { File.read('spec/support/files/base64_image.txt') }
      let(:attributes) { attributes_for(:post).merge(image: base64_image) }

      it 'returns image path' do
        # prevent paperclip from actually saving image to disk
        allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(true)

        post "/api/v1/posts", params: {
          data: {
            type: 'posts',
            attributes: attributes
          }
        }.to_json, headers: api_headers

        expect(json_data['attributes']['image']).to include('/system/posts/images')
      end
    end

    context 'without image' do 
      let(:attributes) { attributes_for(:post).merge(image: nil) }

      it 'returns missing.png' do
        post "/api/v1/posts", params: {
          data: {
            type: 'posts',
            attributes: attributes
          }
        }.to_json, headers: api_headers

        expect(json_data['attributes']['image']).to eq('/images/original/missing.png')
      end
    end
  end
end
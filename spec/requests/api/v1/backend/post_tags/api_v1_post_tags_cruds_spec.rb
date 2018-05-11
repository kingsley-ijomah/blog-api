require 'rails_helper'

RSpec.describe "Api::V1::Backend::PostTags::Cruds", type: :request do
  describe 'POST #create a new post' do
    context 'with post_tags' do
      it 'saves post along with 1 post_tags' do
        expect {
          create_post_request(post_attributes)
        }.to change(PostTag, :count).by(1)
      end
    end

    context 'without post_tags' do
      it 'saves post with 0 post_tags' do
        expect {
          create_post_request(post_attributes.merge(tag_ids: []))
        }.to change(PostTag, :count).by(0)
      end
    end
  end

  describe 'PUT #update post having post_tags' do 
    context 'with new post_tags' do
      let(:old_tag_id) { create(:tag).id }
      let(:new_tag_id) { create(:tag).id }

      it 'removes old post_tags and updates wit new ones' do 
        create_post_request(post_attributes.merge(tag_ids: [old_tag_id]))
        expect(PostTag.find_by(tag_id: old_tag_id)).to_not eq(nil)

        update_post_request({tag_ids: [new_tag_id]})
        expect(PostTag.find_by(tag_id: old_tag_id)).to be(nil)
        expect(PostTag.find_by(tag_id: new_tag_id)).to_not eq(nil)
      end
    end

    context 'with no post_tags' do
      it 'saves post with zero post tags' do 
        create_post_request(post_attributes)
        expect(Post.last.post_tags.count).to eq(1)

        update_post_request({tag_ids: []})
        expect(Post.last.post_tags.count).to eq(0)
      end
    end
  end
end

def create_post_request(post_attributes)
  post "/api/v1/backend/posts", params: {
    data: {
      type: 'posts',
      attributes: post_attributes
    }
  }.to_json, headers: api_headers
end

def update_post_request(attr = {}, record = Post.last)
  put "/api/v1/backend/posts/#{record.id}", params: {
    data: {
      type: 'posts',
      id: record.id,
      attributes: attr
    }
  }.to_json, headers: api_headers
end


def post_attributes
  attributes_for(:post)
end
# example of use
#
#  cruds to be generated
#  crud_methods = ['index', 'show', 'create', 'update', 'delete', 'paginate']
#
# include_examples "crud_requests", crud_methods  do 
#   let(:model) { Driver }
#   let(:belongs_to) { { user_id: User.create.id } }
#   let(:api_version) { 'v1' }
# end


shared_examples "crud_requests" do |crud_methods|
  describe "GET #index" do
    before(:each) { create_list(model_to_s, 5) }

    it "returns successful status code 200" do
      index_request
      expect(response).to have_http_status(200)
    end

    it "it returns 5 records" do
      index_request
      expect(json_data.count).to eq(5)
    end
  end if crud_methods.include? 'index'

  describe "GET #show" do
    before(:each) { create(model_to_s) }

    it 'it returns status 400 for existing id' do 
      show_request
      expect(response).to have_http_status(200)
    end

    it 'returns status 404 for non-existent id' do
      show_request(0)
      expect(response).to have_http_status(404)
    end
  end if crud_methods.include? 'show'

  describe "POST #create" do
    context 'valid data' do
      it 'returns success status code 201' do
        create_request
        expect(response).to have_http_status(201)
      end

      it 'saves into database' do
        expect{create_request}.to change(model, :count).by(1)
      end
    end

    context 'invalid data' do 
      it 'returns unprocessible entity code 422' do
        create_request(invalid_data)
        expect(response).to have_http_status(422)
      end

      it 'does not save into database' do
        expect{create_request(invalid_data)}.to change(model, :count).by(0)
      end
    end
  end if crud_methods.include? 'create'

  describe "PUT #update" do
    before(:each) { create(model_to_s) }

    context 'valid data' do 
      let(:valid_update) { update_request(valid_data) }

      it 'returns ok status code 200' do
        valid_update
        expect(response).to have_http_status(200)
      end

      it 'does not create new record' do
        expect { valid_update }.to change(model, :count).by(0)
      end
    end

    context 'invalid data' do 
      let(:invalid_update) { update_request(invalid_data) }

      it 'returns unprocessible entity code 422' do
        invalid_update
        expect(response).to have_http_status(422)
      end

      it 'does not save into database' do
        expect { invalid_update }.to change(model, :count).by(0)
      end
    end
  end if crud_methods.include? 'update'

  describe "DELETE #destroy" do
    before(:each) { create(model_to_s) }

    it 'removes record from database' do 
      expect { delete_request }.to change(model, :count).by(-1)
    end
  end if crud_methods.include? 'delete'

  describe "paginate" do
    before(:each) { create(model_to_s) }

    it 'has navigation links' do 
      index_request

      expect(json_links).to_not be(nil)

      expect(json_links['first']).to_not be(nil)
      expect(json_links['last']).to_not be(nil)
    end
  end if crud_methods.include? 'paginate'
end

# helper methods

def base_endpoint
  "/api/#{api_version}/#{model_to_s.pluralize}"
end

def index_request
  get base_endpoint, headers: api_headers
end

def show_request(id = model.last.id)
  get "#{base_endpoint}/#{id}", headers: api_headers
end

def create_request(attributes = valid_data)
  post base_endpoint, params: {
    data: {
      type: model_to_s.pluralize,
      attributes: attributes
    }
  }.to_json, headers: api_headers
end

def update_request(attr = {}, record = model.last)
  put "#{base_endpoint}/#{record.id}", params: {
    data: {
      type: model_to_s.pluralize,
      id: record.id,
      attributes: attr
    }
  }.to_json, headers: api_headers
end

def delete_request(record = model.last)
  delete "#{base_endpoint}/#{record.id}", headers: api_headers
end

def valid_data
  attributes_for(model_to_s).merge(belongs_to)
end

def invalid_data
  valid_data.transform_values! {|v| v = ''}
end

def model_to_s
  model.to_s.underscore
end

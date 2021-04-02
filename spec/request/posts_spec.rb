require './spec/rails_helper.rb'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do 
    before { get '/posts' }

    it "Should return OK" do
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end

  end

  describe "With data in the DB" do
    before { get '/posts' }
    let(:posts){ create_list(:post, 10, published: true) }

    it "should return all the published posts" do
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(posts.size)
      expect(response).to have_http_status(200)
    end
  end
  
  describe "GET /posts/{id}" do
    let(:post){ create(:post) }
    
    it "should return a post" do
      before { get "/posts/#{post.id}" }
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["id"]).to eq(post.id)
      expect(response).to have_http_status(200)
    end
  end
end
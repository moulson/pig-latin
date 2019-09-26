require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http found/redirect" do
      get :destroy
      expect(response).to have_http_status(:found)
    end
    
    it "redirects to the app root" do
      get :destroy
      expect(response).to redirect_to(root_path)
    end
  end

end

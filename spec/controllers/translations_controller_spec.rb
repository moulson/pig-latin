require 'rails_helper'

def setup
  @controller = TranslationsController.new
end

describe TranslationsController do
  # This should return the minimal set of attributes required to create a valid
  # Translation. As you add validations to Translation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      input: "Risk Assessment"
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
    
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TranslationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Translation.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      translation = Translation.create! valid_attributes
      get :show, params: {id: translation.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      translation = Translation.create! valid_attributes
      get :edit, params: {id: translation.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Translation" do
        expect {
          post :create, params: {translation: valid_attributes}, session: valid_session
        }.to change(Translation, :count).by(1)
      end

      it "redirects to the created translation" do
        post :create, params: {translation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(translations_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {translation: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested translation" do
        translation = Translation.create! valid_attributes
        put :update, params: {id: translation.to_param, translation: new_attributes}, session: valid_session
        translation.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the translation" do
        translation = Translation.create! valid_attributes
        put :update, params: {id: translation.to_param, translation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(translation)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        translation = Translation.create! valid_attributes
        put :update, params: {id: translation.to_param, translation: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested translation" do
      translation = Translation.create! valid_attributes
      expect {
        delete :destroy, params: {id: translation.to_param}, session: valid_session
      }.to change(Translation, :count).by(-1)
    end

    it "redirects to the translations list" do
      translation = Translation.create! valid_attributes
      delete :destroy, params: {id: translation.to_param}, session: valid_session
      expect(response).to redirect_to(translations_url)
    end
  end

  describe 'Translation' do
    it 'translated consonants in a row correctly' do

    end
  end

end

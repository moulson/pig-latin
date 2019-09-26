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

  #Words that have multiple vowels after the inital consonant
  

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
    
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TranslationsController. Be sure to keep this updated too.

  describe "GET #index" do
    it "returns a success response" do
      Translation.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      translation = Translation.create! valid_attributes
      get :show, params: {id: translation.to_param}
      expect(response).to be_successful
    end
  end
  context 'with admin account' do
    before(:each) do
      controller.stub(:current_user) { User.new(
        email: "test",
        password: "test",
        role: "Admin"
      )}
    end
    describe "GET #edit" do
      it "returns a success response" do
        translation = Translation.create! valid_attributes
        get :edit, params: {id: translation.to_param}
        expect(response).to be_successful
      end
    end
    describe "GET #show" do
      it "returns a success response" do
        translation = Translation.create! valid_attributes
        get :show, params: {id: translation.to_param}
        expect(response).to be_successful
      end
    end
    describe "POST #create" do
      context "with valid params" do
        it "creates a new Translation" do
          expect {
            post :create, params: {translation: valid_attributes}
          }.to change(Translation, :count).by(1)
        end
  
        it "redirects to the created translation" do
          post :create, params: {translation: valid_attributes}
          expect(response).to redirect_to(translations_path)
        end
      end
  
      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {translation: invalid_attributes}
          expect(response).to be_successful
        end
      end
    end
    describe "DELETE #destroy" do
      it "destroys the requested translation" do
        translation = Translation.create! valid_attributes
        expect {
          delete :destroy, params: {id: translation.to_param}
        }.to change(Translation, :count).by(-1)
      end
  
      it "redirects to the translations list" do
        translation = Translation.create! valid_attributes
        delete :destroy, params: {id: translation.to_param}
        expect(response).to redirect_to(translations_url)
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }
  
        it "updates the requested translation" do
          translation = Translation.create! valid_attributes
          put :update, params: {id: translation.to_param, translation: new_attributes}
          translation.reload
          skip("Add assertions for updated state")
        end
  
        it "redirects to the translations index" do
          translation = Translation.create! valid_attributes
          put :update, params: {id: translation.to_param, translation: valid_attributes}
          expect(response).to redirect_to(translations_path)
        end
      end
  
      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          translation = Translation.create! valid_attributes
          put :update, params: {id: translation.to_param, translation: invalid_attributes}
          expect(response).to be_successful
        end
      end
    end
  end

  context 'with standard account' do
    before(:each) do
      controller.stub(:current_user) { User.new(
        email: "test",
        password: "test",
        role: "Standard"
      )}
    end
    describe "GET #edit" do
      it "returns a success response" do
        translation = Translation.create! valid_attributes
        get :edit, params: {id: translation.to_param}
        expect(response).to be_successful
      end
    end
    describe "GET #show" do
      it "returns a success response" do
        translation = Translation.create! valid_attributes
        get :show, params: {id: translation.to_param}
        expect(response).to be_successful
      end
    end
    describe "POST #create" do
      context "with valid params" do
        it "creates a new Translation" do
          expect {
            post :create, params: {translation: valid_attributes}
          }.to change(Translation, :count).by(1)
        end
  
        it "redirects to the created translation" do
          post :create, params: {translation: valid_attributes}
          expect(response).to redirect_to(translations_path)
        end
      end
  
      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {translation: invalid_attributes}
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE #destroy" do
      it "can\'t destroy the requested translation" do
        translation = Translation.create! valid_attributes
        expect {
          delete :destroy, params: {id: translation.to_param}
        }.to change(Translation, :count).by(0)
      end
  
      it "redirects to the translations list" do
        translation = Translation.create! valid_attributes
        delete :destroy, params: {id: translation.to_param}
        expect(response).to redirect_to(translations_url)
      end
    end

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attributes) {
          skip("Add a hash of attributes valid for your model")
        }
  
        it "updates the requested translation" do
          translation = Translation.create! valid_attributes
          put :update, params: {id: translation.to_param, translation: new_attributes}
          translation.reload
          skip("Add assertions for updated state")
        end
  
        it "redirects to the translation" do
          translation = Translation.create! valid_attributes
          put :update, params: {id: translation.to_param, translation: valid_attributes}
          expect(response).to redirect_to(translations_path)
        end
      end
  
      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          translation = Translation.create! valid_attributes
          put :update, params: {id: translation.to_param, translation: invalid_attributes}
          expect(response).to be_successful
        end
      end
    end
  end  

  describe 'Translation' do
    before(:each) do
      controller.stub(:current_user) { User.new(
        email: "test",
        password: "test",
        role: "Admin"
      )}
    end

    let(:special){
      {
        input: "Question"
      }
    }
    let(:multiple_words){
      {
        input: "Test Area"
      }
    }
  
    let(:consonant_consonant){
      {
        input: "Trimmed"
      }
    }
  
    let(:consonant_vowel){
      {
        input: "Testing"
      }
    }
  
    let(:vowel){
      {
        input: "Assessment"
      }
    }
  
    let(:sentence){
      {
        input: "The Quick Brown Fox Jumps Over The Lazy Dog"
      }
    }

    it 'translates consonant clusters a row correctly' do
      
      post :create, params: {translation: consonant_consonant}
      the_post = Translation.first
      expect(the_post.output).to eq('Immedtray')
    end

    it 'translates words beginning with vowels correctly' do
      post :create, params: {translation: vowel}
      the_post = Translation.first
      expect(the_post.output).to eq('Assessmentay')
    end

    it 'translates special cases' do
      post :create, params: {translation: special}
      the_post = Translation.first
      expect(the_post.output).to eq('Estionquay')
    end

    it 'translates consonant-vowel words correctly' do
      post :create, params: {translation: consonant_vowel}
      the_post = Translation.first
      expect(the_post.output).to eq('Estingtay')
    end

    it 'translates multiple words' do
      post :create, params: {translation: multiple_words}
      the_post = Translation.first
      expect(the_post.output).to eq('Esttay Areaay')
    end

    it 'translates a sentence' do
      post :create, params: {translation: sentence}
      the_post = Translation.first
      expect(the_post.output).to eq('Ethay Ickquay Ownbray Oxfay Umpsjay Overay Ethay Azylay Ogday')
    end

  end

end

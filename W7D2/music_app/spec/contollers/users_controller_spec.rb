require "rails_helper"
RSpec.describe UsersController, :type => :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        post :create, params: { user: { email: "someemail@email.com", username: "ausername", password: "" } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end

      it "validates that password is long enough" do
        post :create, params: { user: { email: "anothertry@gmail.com", username: "whatever", password: "just" } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end

      it "validates that the password is at least 6 characters long" do
        post :create, params: { user: { email: "jackjack@jack.com", username: "hahaha", password: "asdfas" } }
        expect(response).to redirect_to(new_session_url)
      end
    end

    context "with valid params" do
      it "redirects user to bands index on success"
    end
  end
end

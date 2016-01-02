require 'spec_helper'

RSpec.describe UsersController, type: :controller do

  context "new" do
    it "successfully renders the registration form" do
      get :new
      expect(response).to be_success
    end
  end
  context "create" do
    let(:user) {FactoryGirl.build(:user)}
    it "redirects to root path if user credentials pass validation" do
      post :create, username: user.username, email: user.email, password: user.password, password_confirmation: user.password_confirmation
      expect(response).to redirect_to root_path
    end
    let(:user2) {FactoryGirl.build(:user, username: "abc")}
    it "redirects to registration path if username is invalid" do
      post :create, username: user2.username, email: user2.email, password: user2.password, password_confirmation: user2.password_confirmation
      expect(response).to render_template('new')
    end
  end
end

require 'rails_helper'

RSpec.describe PhotosController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to be_success
    end
  end

  describe "GET create" do
    it "returns http success" do
      get :create
      expect(response).to be_success
    end
  end

  describe "GET destory" do
    it "returns http success" do
      get :destory
      expect(response).to be_success
    end
  end

end

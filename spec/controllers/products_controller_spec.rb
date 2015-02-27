require 'spec_helper'

describe ProductsController, type: :controller do

  describe "show action" do
    it "renders show template if product is found" do
      product = create :product
      get :show, {id: product.id}

      expect(response).to render_template('show')
    end

    it "redirects to root_path if product cannot be found" do
      product = create :product
      get :show, {id: 2}

      expect(response).to redirect_to(root_path)
    end
  end

  describe "new action" do
    it "is available for admins" do
      sign_in 'admin'
      get :new

      expect(response).to render_template('new')
    end

    it "is not available for user" do
      sign_in
      get :new

      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq("You are not authorized to access this page.")
    end

    it "is not available for guest" do
      sign_in nil
      get :new
      
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq("You are not authorized to access this page.")
    end
  end

  describe "create action" do
    let(:invalid_params) { {product: {id: 1, title: "", description: "Description", category_id: 1}} }

    it "is creates product and redirects to product if admin" do
      sign_in 'admin'

      expect { post :create, product: attributes_for(:product) }.to change(Product, :count).by(1)
      expect(response).to redirect_to(Product.last)
    end

    it "renders new if product isn't saved" do
      sign_in 'admin'
      post :create, invalid_params

      expect(response).to render_template('new')
    end

    it "is not available for user" do
      sign_in
      post :create, product: attributes_for(:product)

      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq("You are not authorized to access this page.")
    end

    it "is not available for guest" do
      sign_in nil
      post :create, product: attributes_for(:product)
      
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq("You are not authorized to access this page.")
    end
  end

  describe "destroy action" do
    before(:each) do
      @product = create :product
      sign_in 'admin'
    end

    it "should render nothing" do
      delete :destroy, id: @product.id

      expect(response.body).to be_blank
    end

    it "destroy a product" do
      expect {
        delete :destroy, id: @product.id
      }.to change(Product, :count).by(-1)
    end
  end
end

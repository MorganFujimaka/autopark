require 'spec_helper'

describe ProductsController do

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
end

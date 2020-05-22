require 'rails_helper'

describe GoodsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before do
      login_user user
    end

    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  # template作成前の為コメントアウト
  # describe 'GET #edit' do
  #   before do
  #     login_user user
  #   end

  #   it "@goodに正しい値が入っていること" do
  #     user = create(:user)
  #     category = create(:category)
  #     good = create(:good, user_id: user.id, category_id: category.id)
  #     get :edit, params: { id: good }
  #     expect(assigns(:good)).to eq good
  #   end

  #   it "edit.html.hamlに遷移すること" do
  #     user = create(:user)
  #     category = create(:category)
  #     good = create(:good, user_id: user.id, category_id: category.id)
  #     get :edit, params: { id: good }
  #     expect(response).to render_template :edit
  #   end
  # end

  describe 'GET #show' do
    it "@goodに正しい値が入っていること" do
      user = create(:user)
      category = create(:category)
      good = create(:good, user_id: user.id, category_id: category.id)
      get :show, params: { id: good }
      expect(assigns(:good)).to eq good
    end

    it "@userに正しい値が入っていること" do
      user = create(:user)
      category = create(:category)
      good = create(:good, user_id: user.id, category_id: category.id)
      get :show, params: { id: user }
      expect(assigns(:user)).to eq user
    end

    it "show.html.hamlに遷移すること" do
      user = create(:user)
      category = create(:category)
      good = create(:good, user_id: user.id, category_id: category.id)
      get :show, params: {id: good}
      expect(response).to render_template :show
    end
  end

  describe 'DELETE #destroy' do
    before do
      sign_in(user)
    end

    it "goodが削除されること" do
      user = create(:user)
      category = create(:category)
      good = create(:good, user_id: user.id, category_id: category.id)
      expect do
        delete :destroy, params: { id: good.id }
      end.to change(Good, :count).by(-1)
    end

    it "rootにredirectすること" do
      user = create(:user)
      category = create(:category)
      good = create(:good, user_id: user.id, category_id: category.id)
      delete :destroy, params: { id: good.id }
      expect(response).to redirect_to(root_path)
    end
  end

end
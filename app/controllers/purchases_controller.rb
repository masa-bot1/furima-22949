class PurchasesController < ApplicationController
  def index
    @user_purchase = UserPurchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @user_purchase.valid?

      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @user_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end

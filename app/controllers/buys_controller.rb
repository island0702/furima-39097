class BuysController < ApplicationController
  before_action :authenticate_user!
  # before_action :non_purchased_item, only: [:index, :create]

  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  # def buy_params
  #   # この時点では、order_idが不要。またrequire外の情報は参照するため、mergeとする。
  #   params.require(:order_form).
  #   permit(:municapality, :address, :area_of_origin_id, :telephone_number, :building_name, :post_code).
  #   merge(user_id: current_user.id, item_id: 
  #     params[:item_id], token: params[:token])
  # end

  # def pay_item
  #   Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  #   Payjp::Charge.create(
  #     amount: @item.price,        # 商品の値段
  #     card: buy_params[:token], # カードトークン
  #     currency: 'jpy'             # 通貨の種類（日本円）
  #   )
  # end

#   def non_purchased_item
#     # itemがあっての、order_form（入れ子構造）。他のコントローラーで生成されたitemを使うにはcreateアクションに定義する。
#     @item = Item.find(params[:item_id])
#     redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
#   end
end
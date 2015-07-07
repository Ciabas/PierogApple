module Filterable
  extend ActiveSupport::Concern

  def params_check    
    products = Product.all
    unless params[:cid].blank?
      products = products.where( category_id: params[:cid] )
      cid = params[:cid]
    end
    unless params[:price_min].blank?
      products = products.where( [ 'price >= ?', params[:price_min] ] )
      price_low = params[:price_min]
    end
    unless params[:price_max].blank?
      products = products.where( [ 'price <= ?', params[:price_max] ] )
      price_high = params[:price_max]
    end
    unless params[:g].blank?
      gear = Gear.where(parent_id: params[:g])
      products = products.where( gear_id: gear )
      models = Gear.where( parent_id: params[:g] )
      g = params[:g]
    end
    unless params[:m].blank?
      products = products.where( gear_id: params[:m] )
      m = params[:m]
    end
    return products, cid, price_low, price_high, models, g, m  
  end
end

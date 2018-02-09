module Pos::ProductsHelper
  def render_product_row(label_text, value)
    render 'pos/products/show_product_row', attrs: {label_text: label_text, value: value}
  end
end

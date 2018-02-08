module Pos::Suppliers::PurchasesHelper
  def link_to_add_product(name, form, association, options = {}, purchase = nil)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |builder|
      render("#{association.to_s.singularize}_fields#{purchase.present? ? '_edit' : ''}", ff: builder)
    end
    link_to '#', class: "#{options[:klass]}", data: {id: id, fields: fields.gsub('\n', '')} do
      raw "<i class='fa fa-plus-circle'></i> #{name}"
    end
  end

  def received_status(purchase)
    if purchase.is_received
      raw "<label class='label label-success pt5 pr10 pb5 pl10 br5'> Received </label>"
    else
      html = "<label class='label label-warning pt5 pr10 pb5 pl10 br5'> Pending </label>"
      html += "<a href=#{receive_pos_suppliers_purchase_path(purchase)} class='btn btn-success ml5 pt0 pb0 pr8 pl8' title='Receive Order'><i class='fa fa-check-circle'></i></a>"
      # html += "<a href=#{receive_pos_suppliers_purchase_path(purchase)} class='btn btn-danger ml5 pt2 pb2 pr8 pl8' title='Cancel Order'><i class='fa fa-ban'></i></a>"
      raw html
    end
  end
end

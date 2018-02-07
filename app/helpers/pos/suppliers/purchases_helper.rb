module Pos::Suppliers::PurchasesHelper
  def link_to_add_product(purchase, name, form, association, options = {})
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |builder|
      render("#{association.to_s.singularize}_fields#{purchase.persisted? ? '_edit' : ''}", ff: builder)
    end
    link_to '#', class: "#{options[:klass]}", data: {id: id, fields: fields.gsub('\n', '')} do
      raw "<i class='fa fa-plus-circle'></i> #{name}"
    end
  end

  def received_status(purchase)
    if purchase.is_received
      raw "<label class='label label-success'> Received </label>"
    else
      raw "<label class='label label-warning'> Received </label>"
    end
  end
end

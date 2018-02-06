class Pos::Products::ModelsController < InheritedResources::Base
  before_action :set_model, only: [:show, :edit, :update, :delete]

  def index
    @models = current_department.models
  end

  def show

  end

  def new
    @model = Pos::Products::Model.new
  end

  def create
    @model = current_department.models.build(model_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to pos_products_models_path, notice: 'Model saved successfully.' }
      else
        format.html { redirect_to pos_products_models_path, error: 'Model saving failed.' }
      end
      format.js {}
    end
  end

  def edit

  end

  def update
    if @model.update(model_params)
      flash[:notice] = 'Model info updated successfully.'
    else
      flash[:error] = 'Model info update failed.'
    end
    redirect_to pos_products_models_path
  end

  def delete
    if @model.destroy
      flash[:notice] = 'Model deleted successfully.'
    else
      flash[:error] = 'Model deletion failed.'
    end
    redirect_to pos_products_models_path
  end

  private

  def set_model
    @model = Pos::Products::Model.find(params[:id])
  end

  def model_params
    params.require(:pos_products_model).permit!
  end
end


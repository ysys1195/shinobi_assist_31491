class OpenLastResortsController < ApplicationController
  def unveiled
    open_last_resort = OpenLastResort.find(params[:id])
    if open_last_resort.unveiled_id == 1
      open_last_resort.update(unveiled_id: 2)
    else
      open_last_resort.update(unveiled_id: 1)
    end

    item = OpenLastResort.find(params[:id])
    render json: { open_last_resort: item, unveil: item.unveiled.name }
  end
end

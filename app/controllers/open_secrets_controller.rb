class OpenSecretsController < ApplicationController
  def unveiled
    open_secret = OpenSecret.find(params[:id])
    if open_secret.unveiled_id == 1
      open_secret.update(unveiled_id: 2)
    else
      open_secret.update(unveiled_id: 1)
    end

    item = OpenSecret.find(params[:id])
    render json: { open_secret: item, unveil: item.unveiled.name }
  end
end

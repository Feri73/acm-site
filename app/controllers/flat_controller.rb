class FlatController < ApplicationController
  def show
    render 'flat/'+params[:name]
    #if params[:name] == "about"
    #  render 'flat/about'
    #elsif params[:name] == "officers"
    #  render 'flat/officers'
    #end
  end
end

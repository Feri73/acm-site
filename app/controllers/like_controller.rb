class LikeController < ApplicationController
  def new
    #if !current_user
    #  @error = "err_sign_in"
    #else
      if  params[:model_name] and params[:id]
        begin
          cl = params[:model_name].singularize.classify.constantize
        rescue
          @error = "err_no_class"
        end
        if cl
          @votable = cl.find_by_id(params[:id])
          if @votable
            begin
              voter = User.find_by_email("default@votable.com")
              @votable.liked_by voter, :duplicate => true
            rescue
                @error ="err_cant_like"
            end
          else
            @error = "err_no_obj"
          end
        end
      else
        @error = "err_no_class"
      end
    #end
  end

  def destroy
    #if !current_user
    #  @error = "err_sign_in"
    #else
      if  params[:model_name] and params[:id]
        begin
          cl = params[:model_name].singularize.classify.constantize
        rescue
          @error = "err_no_class"
        end
        if cl
          @votable = cl.find_by_id(params[:id])
          if @votable
            begin
              voter = User.find_by_email("default@votable.com")
              @votable.unliked_by voter, :duplicate => true
            rescue
              @error ="err_cant_unlike"
            end
          else
            @error = "err_no_obj"
          end
        end
      else
        @error = "err_no_class"
      end
    end
  #end
end

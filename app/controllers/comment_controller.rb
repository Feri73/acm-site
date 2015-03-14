class CommentController < ApplicationController

  def index
    unless user_signed_in? and current_user.is_admin?
      redirect_to posts_path
    end
  end

  def create
    #if !current_user
    #  @error = "err_sign_in"
    #else
      if  params[:model_name] and params[:id] and params[:body]
        begin
          cl = params[:model_name].singularize.classify.constantize
        rescue
          @error = "err_no_class"
        end
        if cl
          commentable = cl.find_by_id(params[:id])
          if commentable
            begin
              body = params[:body]
              commener= User.find_by_email("default@votable.com")
              @comment = Comment.build_from(commentable,commener.id, body)
              @comment.save
            rescue
              @error ="err_cant_comment"
            end
          else
            @error = "err_no_commentable"
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
      if  params[:id]
        c = Comment.find_by_id(params[:id])
        if c
          #if c.user_id == current_user.id
          if c.has_role("admin")
            @commen_id = c.id
            c.delete
          else
            @error = "err_access_denied"
          end
        else
          @error = "err_no_comment"
        end
      else
        @error = "err_no_comment"
      end
    #end
  end
end

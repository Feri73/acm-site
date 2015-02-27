class MailMessagesController < ApplicationController
  before_action :set_mail_message, only: [:show, :edit, :update, :destroy]
  before_action :check_authority

  # GET /mail_messages
  # GET /mail_messages.json
  def index
    @mail_messages = MailMessage.all
  end

  # GET /mail_messages/1
  # GET /mail_messages/1.json
  def show
  end

  # GET /mail_messages/new
  def new
    @mail_message = MailMessage.new
  end

  # GET /mail_messages/1/edit
  def edit
  end

  # POST /mail_messages
  # POST /mail_messages.json
  def create
    @mail_message = MailMessage.new(mail_message_params)
    if defined? params[:send_to_all] and params[:send_to_all] == true
      @mail_message << User.all
    end
    respond_to do |format|
      if @mail_message.save
        #@mail_message.users.each do |u|
        #  UserMailer.send_custom_mail(@mail_message.body, @mail_message.subject, u.email).deliver
        #end

        format.html { redirect_to @mail_message, notice: 'Mail message was successfully created.' }
        format.json { render :show, status: :created, location: @mail_message }
      else
        format.html { render :new }
        format.json { render json: @mail_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mail_messages/1
  # PATCH/PUT /mail_messages/1.json
  def update
    respond_to do |format|
      if @mail_message.update(mail_message_params)
        format.html { redirect_to @mail_message, notice: 'Mail message was successfully updated.' }
        format.json { render :show, status: :ok, location: @mail_message }
      else
        format.html { render :edit }
        format.json { render json: @mail_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_messages/1
  # DELETE /mail_messages/1.json
  def destroy
    @mail_message.destroy
    respond_to do |format|
      format.html { redirect_to mail_messages_url, notice: 'Mail message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_message
      @mail_message = MailMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_message_params
      params.require(:mail_message).permit(:body, :subject, :OtherMails, :users)
    end
    def check_authority
      unless user_signed_in? and current_user.is_admin?
        redirect_to posts_path
      end
    end
end

class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  def create_message
    application = Application.find_by(token: params[:chat][:app_token]) if params[:chat]
    chat = Chat.find_by(application_id: application.id, number: params[:message][:chat_number]) if application.present? && params[:message]
    result = chat.create_message(params[:message][:content]) if chat.present?
    if result.present? &&  result[:status] == "created"
      render json: result[:chat], status: :created
    else
      render json: {error_message: "Unable to create chat"}, status: :unprocessable_entity
    end
  end

  def search
    @messages = Message.search_in_chat(params[:id], params[:search_text]).map do |message|
      {
          content: message['content'],
          message_number: message['number']
      }
    end
    render json: @messages, status: :ok
  end

  # GET /chats
  # GET /chats.json
  def index
    @chats = Chat.all
  end

  # GET /chats/1
  # GET /chats/1.json
  def show
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url, notice: 'Chat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.require(:chat).permit(:name, :app_token)
    end
end

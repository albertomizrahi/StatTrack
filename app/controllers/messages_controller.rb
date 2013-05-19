class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      #Send email to me which user's comments
      MessageMailer.contact_us_message(@message).deliver
      redirect_to root_url, notice: "Message sent! Thank you for contacting us."
    else
      render "new"
    end
  end

end

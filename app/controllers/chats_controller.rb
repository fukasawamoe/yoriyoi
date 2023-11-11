class ChatsController < ApplicationController

  def index
    @client = OpenAiClient.new

    input = params[:input]
    @response = client.chat(input)
  end
end

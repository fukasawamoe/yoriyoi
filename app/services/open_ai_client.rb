class OpenAiClient
  require 'openai'
  require 'dotenv'
  Dotenv.load
  def initialize(current_task)
    @current_task = current_task
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
  end

  def chat
    additional_prompt = "Please respond in Japanese and add 'にゃ' or 'にゃん' at the end of your sentences, mimicking a cute and playful tone.
    don't use honorifics. #{@current_task.to_do}"

    response = @client.chat(
      parameters: {
          model: "gpt-3.5-turbo",
          messages: [
            { role: "system", content: additional_prompt }
          ],
      })
    response.dig("choices", 0, "message", "content")
  end
end
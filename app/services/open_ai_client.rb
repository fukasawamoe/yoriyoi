class OpenAiClient
  require 'openai'

  def initialize
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
  end

  def chat(input)
    additional_prompt = "Please respond in Japanese and add 'にゃ' or 'にゃん' at the end of your sentences, mimicking a cute and playful tone.
    don't use honorifics. #{task.task_time.strftime('%H:%M')} #{task.to_do}."
    response = @client.chat(
      parameters: {
          model: "gpt-3.5-turbo",
          messages: [
            { role: "system", content: additional_prompt },
            { role: "user", content: input },
          ],
      })
    response.dig("choices", 0, "message", "content")
  end
end
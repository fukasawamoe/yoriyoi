class OpenAiClient
  require 'openai'
  require 'dotenv'
  Dotenv.load
  def initialize(current_task, character)
    @current_task = current_task
    @character = character
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
  end

  def chat
    additional_prompt = "Address the task #{@current_task.to_do} by embodying the following character traits in two to three lines of Japanese, without using the user's name:
    Personality: #{@character.personality}
    Communication style: #{ @character.communication_style }
    Relationship to the user: #{ @character.relationship }
    Additional settings: #{ @character.additional }"

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
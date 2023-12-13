module CharactersHelper
  def select_field(field, prompt, choices, form)
    label = form.label field, prompt, class: "leading-7 text-sm text-gray-600"
    select = form.select field, choices, {}, required: true, class: "w-full bg-white rounded border border-gray-300 focus:ring-2 focus:ring-indigo-600 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"
    content_tag(:div, label + select)
  end

  # 日本語訳のためのメソッド
  def display_personality(personality_key)
    personalities = {
      'frisky' => '明るい',
      'kind' => '優しい',
      'strict' => '厳しい',
      'amusing' => '面白い',
      'polite' => '礼儀正しい',
      'affectionate' => '愛情深い',
      'gracious' => '上品'
    }
    personalities[personality_key] || '不明'
  end

  def display_communication_style(communication_style_key)
    communication_styles = {
      'Casual Japanese' => '友達口調',
      'Polite Japanese' => '敬語',
      'tone of command' => '命令口調'
    }
    communication_styles[communication_style_key] || '不明'
  end

  def display_relationship(relationship_key)
    relationships = {
      'friend' => '友達',
      'family' => '家族',
      'senior' => '先輩',
      'junior' => '後輩',
      'boyfriend' => '恋人"男性"',
      'girlfriend' => '恋人"女性"'
    }
    relationships[relationship_key] || '不明'
  end
end

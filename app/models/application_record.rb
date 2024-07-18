class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # バリデーションメッセージにメッセージにカラム名を非表示
  def self.human_attribute_name(attr, options = {})
    ""
  end
end

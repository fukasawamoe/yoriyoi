class Form::ScheduleCollection < Form::Base
  FORM_COUNT = 1 #ここで、作成したい登録フォームの数を指定
  attr_accessor :schedules

  def initialize(attributes = {})
    super attributes
    self.schedules = FORM_COUNT.times.map { Schedule.new() } unless self.schedules.present?
  end

  # 上でsuper attributesとしているので必要
  def schedules_attributes=(attributes)
    self.schedules = attributes.map do |_, v|
      v['goal_select'] = v['goal_select'].to_i
      Schedule.new(v)
    end
  end

  def save
    # 実際にやりたいことはこれだけ
    # self.memos.map(&:save!)

    # 複数件全て保存できた場合のみ実行したいので、transactionを使用する
    Schedule.transaction do
      self.schedules.map do |product|
        if schedules.presence
          schedule.save
        end
      end
    end
      return true
    rescue => e
      return false
  end
end
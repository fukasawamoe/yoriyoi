class Form::ScheduleCollection < Form::Base
    FORM_COUNT = 1
    attr_accessor :schedules
  
    def initialize(attributes = {})
      super attributes
      self.schedules = FORM_COUNT.times.map { Schedule.new() } unless self.schedules.present?
    end
    
    # 上でsuper attributesとしているので必要
    def schedules_attributes=(attributes)
      self.schedules = attributes.map { |_, v| Schedule.new(v) }
    end
  
    def save
      # 実際にやりたいことはこれだけ
      # self.memos.map(&:save!)
  
      # 複数件全て保存できた場合のみ実行したいので、transactionを使用する
      Schedule.transaction do
        self.schedules.map(&:save!)
      end
        return true
      rescue => e
        return false
    end
  end
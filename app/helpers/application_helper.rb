module ApplicationHelper
  def default_meta_tags
    {
      site: 'yoriyoi',
      title: 'よりよいあなたを目指すスケジュール、習慣化サービス',
      reverse: true,
      charset: 'utf-8',
      description: 'yoriyoiはあなたのオリジナルAIキャラクターがスケジュールや目標を通知。スケジュール管理をもっと楽しくできます。',
      keywords: 'スケジュール管理, 目標管理',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('ogp.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end

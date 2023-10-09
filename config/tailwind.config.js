const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    container: {
      center: true,
    },
    extend: {
      fontFamily: {
        'zenmaru': ['Zen Maru Gothic', 'sans-serif'],
        
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('daisyui'),   //ここを追加で導入終了。（,に気をつけないと悲しみを背負う）
  ],
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#8cf75d",
          "secondary": "#f3f4f6",
          "accent": "#8bd0e5",
          "neutral": "#202d3c",
          "base-100": "#ffffff",
          "info": "#81afda",
          "success": "#158475",
          "warning": "#fca145",
          "error": "#eb1e2b",
        },
      },
    ],
  },
}
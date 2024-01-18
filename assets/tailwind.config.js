module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web/**/*.*ex'
  ],
  plugins: [
    require('@tailwindcss/typography'),
    require('daisyui')
  ],
  theme: {
    extend: {
      backgroundImage: {
        'hero-desktop': "url('/images/header_horizontal.jpg')",
        'hero-mobile': "url('/images/header_vertical.jpg')",
      },
      keyframes: {
        wiggle: {
          '0%, 100%': { transform: 'rotate(-10deg)' },
          '50%': { transform: 'rotate(10deg)' },
        }
      },
      animation: {
        wiggle: 'wiggle 1s ease-in-out infinite',
      },
      fontFamily: {
        body: ['Nunito'],
        highlight: ['Alegreya Sans']
      }
    }
  }
}

module.exports = {
  mode: 'jit',
  purge: [
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
        'hero-desktop': "url('/images/hero_desktop.jpg')",
        'hero-mobile': "url('/images/hero_mobile.jpg')"
      },
      keyframes: {
        wiggle: {
          '0%, 100%': { transform: 'rotate(-10deg)' },
          '50%': { transform: 'rotate(10deg)' },
        }
      },
      animation: {
        wiggle: 'wiggle 1s ease-in-out infinite',
      }
    }
  }
}

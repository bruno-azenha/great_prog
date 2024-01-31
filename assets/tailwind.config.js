module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web/**/*.*ex'
  ],
  corePlugins: {
    aspectRatio: false,
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
    require('daisyui')
  ],
  theme: {
    extend: {
      backgroundImage: {
        'hero-desktop': "url('/images/header_horizontal.jpg')",
        'hero-mobile': "url('/images/header_vertical.jpg')",
        'meditation': "url('/images/meditation.jpg')",
        'appreciation-wall': "url('/images/appreciation_wall.jpg')",
        'photoshot-stairs': "url('/images/photoshoot_stairs.jpg')"
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
        body: ['Rambla'],
        highlight: ['Alegreya Sans']
      },
      fontSize: {
        '2.5xl': '22px',
      }
    }
  }
}


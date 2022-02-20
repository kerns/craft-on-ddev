module.exports = {
  content: ["./templates/**/*.{html,twig}"],
  theme: {
    container: {
      center: true,
    },
    extend: {
      minHeight: {
        'screenh' : '100vh'
      }
    },
    fontFamily: {
      sans: ['Lato', 'sans-serif'],
      serif: ['Merriweather', 'serif'],
    }
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
  ],
}
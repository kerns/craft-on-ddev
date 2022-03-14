module.exports = {
  content: ["./templates/**/*.{html,twig}"],
  theme: {
    container: {
      center: true,
    },
    extend: {
      typography: {
        DEFAULT: {
          css: {
            'code::before': {
              content: '""'
            },
            'code::after': {
              content: '""'
            }
          }
        }
      },
      minHeight: {
        'screenh' : '100vh'
      },
      backgroundImage: {
        'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
      },
      // 👇https://www.tailwindshades.com/
      colors: {
        'oxford-blue': {  DEFAULT: '#2E3847',  '50': '#8091AC',  '100': '#7486A4',  '200': '#5F7291',  '300': '#4F5E78',  '400': '#3E4B60',  '500': '#2E3847',  '600': '#28303E',  '700': '#222934',  '800': '#1C222B',  '900': '#161B22'},
        'anzac': {  DEFAULT: '#E6BA4C',  '50': '#FCF8ED',  '100': '#FAF1DB',  '200': '#F5E3B8',  '300': '#F0D694',  '400': '#EBC870',  '500': '#E6BA4C',  '600': '#DBA61F',  '700': '#AA8018',  '800': '#785B11',  '900': '#47360A'},
      }
    },
    fontFamily: {
      headline: ['Inter', 'sans-serif'],
      body: ['Manrope', 'sans-serif'],
    },
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms')
  ],
}

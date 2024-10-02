module.exports = {
  purge: ['./src/**/*.{js,jsx,ts,tsx}', './public/index.html'], 
  darkMode: false, 
  theme: {
    extend: {
      fontFamily: {
        sans: ['Poppins', 'sans-serif'],
      },
      colors:{
        "dark-purple": "#081A51",
        customBlue: '#0B60B0',
        auditBlue:'#E1EEFD',
        customGray: '#5D5D5D', 
       customTableBorder: '#e1eefd',
        customBlack: '#4F4F4F', 
      },
      textColor: {
        DEFAULT: '#4F4F4F', // Setting the default text color
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
        // fontcolor: '#5D5D5D'

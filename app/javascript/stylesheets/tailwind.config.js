module.exports = {
  purge: ["./app/**/*.html.erb"],
  darkMode: false, // or 'media' or 'class'
  theme: {
    textColor: (theme) => ({
      ...theme('colors'),
      "primary": "#314382",
    })
  },
  variants: {
    extend: {},
  },
  plugins: [],
}

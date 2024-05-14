const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*",
<<<<<<< HEAD
    './node_modules/flowbite/**/*.js'
=======
    "./node_modules/flowbite/**/*.js",
>>>>>>> 38e84400299c5cac97b1127626dcde5c9edf2301
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
<<<<<<< HEAD
    require('flowbite/plugin')
=======
    require("flowbite/plugin"),
>>>>>>> 38e84400299c5cac97b1127626dcde5c9edf2301
  ],
};

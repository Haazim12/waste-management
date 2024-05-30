const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*",
    "./node_modules/flowbite/**/*.js",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
    },
    colors: {
      primary: {
        100: "#f0f4ff",
        200: "#d9e4ff",
        300: "#a6c1ff",
        400: "#598bff",
        500: "#3366ff",
        600: "#274bdb",
        700: "#1a34b8",
        800: "#102694",
        900: "#091c7a",
      },
      secondary: {
        100: "#f0f4ff",
        200: "#d9e4ff",
        300: "#a6c1ff",
        400: "#598bff",
        500: "#3366ff",
        600: "#274bdb",
        700: "#1a34b8",
        800: "#102694",
        900: "#091c7a",
      },
      gray: {
        50: "#f9fafb",
        100: "#f4f5f7",
        200: "#e5e7eb",
        300: "#d2d6dc",
        400: "#9fa6b2",
        500: "#6b7280",
        600: "#4b5563",
        700: "#374151",
        800: "#252f3f",
        900: "#161e2e",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
    require("flowbite/plugin"),
  ],
};

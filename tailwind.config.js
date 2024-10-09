// See the Tailwind default theme values here:
// https://github.com/tailwindcss/tailwindcss/blob/master/stubs/defaultConfig.stub.js
// https://www.tints.dev/?primary=FF6F61&green=22C55E&coral=FF6F61&navy=2D3A66&blue=3B82F6&mint=00C2A8&red=EF4444&yellow=FFD166&lilac=E1BEE7&purple=A855F7&cream=FFF8E1
const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

/** @type {import('tailwindcss').Config */
module.exports = {
  darkMode: 'class',

  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/forms')({ strategy: "base" }),
    require('@tailwindcss/typography'),
  ],

  content: [
    './app/components/**/*.rb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.erb',
    './app/views/**/*.haml',
    './app/views/**/*.slim',
    './lib/jumpstart/app/views/**/*.erb',
    './lib/jumpstart/app/helpers/**/*.rb',
  ],

  // All the default values will be compiled unless they are overridden below
  theme: {
    // Extend (add to) the default theme in the `extend` key
    extend: {
      // Create your own at: https://javisperez.github.io/tailwindcolorshades
      colors: {
        "coral": {
          50: "#FFF1F0",
          100: "#FFE3E0",
          200: "#FFC7C2",
          300: "#FFA69E",
          400: "#FF8A80",
          500: "#FF6F61",
          600: "#FF2D1A",
          700: "#D11100",
          800: "#8F0C00",
          900: "#470600",
          950: "#240300"
        },
        "navy": {
          50: "#E6E9F4",
          100: "#CDD4E9",
          200: "#9CA9D3",
          300: "#677BBC",
          400: "#435798",
          500: "#2D3A66",
          600: "#242F51",
          700: "#1B223C",
          800: "#13182A",
          900: "#090C15",
          950: "#05060B"
        },
        "mint": {
          50: "#E0FFFB",
          100: "#C2FFF7",
          200: "#80FFEE",
          300: "#42FFE6",
          400: "#00FFDD",
          500: "#00C2A8",
          600: "#009985",
          700: "#007566",
          800: "#004D42",
          900: "#002923",
          950: "#001412"
        },
        "yellow": {
          50: "#FFFAF0",
          100: "#FFF6E0",
          200: "#FFEDC2",
          300: "#FFE3A3",
          400: "#FFDA85",
          500: "#FFD166",
          600: "#FFBC1F",
          700: "#D69600",
          800: "#8F6400",
          900: "#473200",
          950: "#241900"
        },
        "lilac": {
          50: "#FCF8FC",
          100: "#FAF4FB",
          200: "#F3E5F5",
          300: "#EEDAF1",
          400: "#E7CBEC",
          500: "#E1BEE7",
          600: "#C480D0",
          700: "#A945BA",
          800: "#6F2D7B",
          900: "#39173F",
          950: "#1B0B1E"
        },
        "cream": {
          50: "#FFFEFA",
          100: "#FFFEFA",
          200: "#FFFDF5",
          300: "#FFFAEB",
          400: "#FFF9E5",
          500: "#FFF8E1",
          600: "#FFE180",
          700: "#FFCB1F",
          800: "#C29500",
          900: "#614A00",
          950: "#2E2300"
        },
        primary: colors.coral,
        danger: colors.red,
        success: colors.emerald,
        warning: colors.orange,
        info: colors.cyan,
      },
      fontFamily: {
        sans: ['Inter', ...defaultTheme.fontFamily.sans],
      },
      borderRadius: {
        none: "0px",
        sm: "7px",
        md: "18px",
        full: "50%",
        "2xl": "30px",
        "3xl": "50rem",
      },
      boxShadow: {
        sm: '0 0.5rem 1rem rgba(0,0,0,0.15)',
        md: "0px 2px 6px rgba(37,83,185,0.1)",
        xl: "inset 0 1px 2px rgba(90,106,133,0.075)",
      },
    },
    container: {
      center: true,
      padding: "20px",
    },
  },

  // Opt-in to TailwindCSS future changes
  future: {
  },
  variants: {},
}

// See the Tailwind default theme values here:
// https://github.com/tailwindcss/tailwindcss/blob/master/stubs/defaultConfig.stub.js
// https://www.tints.dev/?primary=FF6F61&green=22C55E&coral=FF6F61&navy=2D3A66&blue=3B82F6&mint=00C2A8&red=EF4444&yellow=FFD166&lilac=E1BEE7&purple=A855F7&cream=FFF8E1
const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')
import { fontFamily as _fontFamily } from 'tailwindcss/defaultTheme'

/** @type {import('tailwindcss').Config */
    export const darkMode = ['class']
  export const plugins = [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/forms')({ strategy: "base" }),
    require('@tailwindcss/typography'),
    require('tailwindcss-animate'),
  ]
  export const content = [
    './app/components/**/*.rb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.erb',
    './app/views/**/*.haml',
    './app/views/**/*.slim',
    './lib/jumpstart/app/views/**/*.erb',
    './lib/jumpstart/app/helpers/**/*.rb',
  ]
  export const theme = {
    extend: {
      colors: {
        primary: colors.blue,
        secondary: colors.gray,
        tertiary: colors.gray,
        danger: colors.red,
        success: colors.green,
        info: colors.blue,
        warning: colors.yellow,
        accent: colors.orange,
        light: colors.gray,
        dark: colors.gray,
        disabled: colors.gray,
        smoke: {
          50: '#fbfaff',
          100: '#f4f2f7',
          200: '#efedf5',
          300: '#dcdae3',
          400: '#c2bfc9',
          500: '#9995a1',
          600: '#716e7a',
          700: '#56525e',
          800: '#3b3745',
          900: '#221e2e',
          950: '#06030e',
        },
        avocado: {
          50: '#fcfef1',
          100: '#f7fcde',
          200: '#f1fab7',
          300: '#e7fa7d',
          400: '#d8f241',
          500: '#b6cc37',
          600: '#8ca30d',
          700: '#6c7c0f',
          800: '#566212',
          900: '#3f4711',
          950: '#282e05',
        },
        sage: {
          50: '#f0fcf9',
          100: '#e4f5f1',
          200: '#ceebe4',
          300: '#abdbd0',
          400: '#73baaa',
          500: '#388f7b',
          600: '#1e6e5b',
          700: '#045946',
          800: '#003b2e',
          900: '#002920',
          950: '#001f18',
        },
        mint: {
          50: '#f5fcf7',
          100: '#e8fcef',
          200: '#D9FAE3',
          300: '#b1f2c3',
          400: '#7ce99b',
          500: '#1eaf47',
          600: '#138f36',
          700: '#0f6e2a',
          800: '#0c5420',
          900: '#014012',
          950: '#00290b',
        },
        cornflower: {
          50: '#f5f8ff',
          100: '#ebf1ff',
          200: '#dbe7ff',
          300: '#bdd3ff',
          400: '#89aef5',
          500: '#668cd4',
          600: '#3f69b5',
          700: '#234c99',
          800: '#0f357c',
          900: '#122e62',
          950: '#142a53',
        },
      },
      fontFamily: {
        sans: ['Inter', ...defaultTheme.fontFamily.sans]
      }
    }
  }

  export const future = {}
  export const variants = {}

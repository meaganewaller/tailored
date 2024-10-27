// See the Tailwind default theme values here:
// https://github.com/tailwindcss/tailwindcss/blob/master/stubs/defaultConfig.stub.js
// https://www.tints.dev/?primary=FF6F61&green=22C55E&coral=FF6F61&navy=2D3A66&blue=3B82F6&mint=00C2A8&red=EF4444&yellow=FFD166&lilac=E1BEE7&purple=A855F7&cream=FFF8E1
import { coral, red, emerald, orange, cyan } from 'tailwindcss/colors'
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
    container: {
        center: true,
        padding: "2rem",
        screens: {
            "2xl": "1400px",
        },
    },
    // Extend (add to) the default theme in the `extend` key
    extend: {
      colors: {
        border: "hsl(var(--border))",
        input: "hsl(var(--input))",
        ring: "hsl(var(--ring))",
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))"
        },
        secondary: {
          DEFAULT: "hsl(var(--secondary))",
          foreground: "hsl(var(--secondary-foreground))",
        },
        destructive: {
          DEFAULT: "hsl(var(--destructive))",
          foreground: "hsl(var(--destructive-foreground))",
        },
        muted: {
          DEFAULT: "hsl(var(--muted))",
          foreground: "hsl(var(--muted-foreground))",
        },
        accent: {
          DEFAULT: "hsl(var(--accent))",
          foreground: "hsl(var(--accent-foreground))",
        },
        popover: {
          DEFAULT: "hsl(var(--popover))",
          foreground: "hsl(var(--popover-foreground))",
        },
        card: {
          DEFAULT: "hsl(var(--card))",
          foreground: "hsl(var(--card-foreground))",
        },
      },
      fontFamily: {
        sans: ['Inter', ..._fontFamily.sans],
      },
      borderRadius: {
        lg: "var(--radius)",
        md: "calc(var(--radius) - 2px)",
        sm: "calc(var(--radius) - 4px)",
      },
      keyframes: {
        "accordion-down": {
          from: { height: "0" },
          to: { height: "var(--radix-accordion-content-height)" },
        },
        "accordion-up": {
          from: { height: "var(--radix-accordion-content-height)" },
          to: { height: "0" },
        },
      },
      animation: {
        "accordion-down": "accordion-down 0.2s ease-out",
        "accordion-up": "accordion-up 0.2s ease-out",
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
}
export const future = {}
export const variants = {}

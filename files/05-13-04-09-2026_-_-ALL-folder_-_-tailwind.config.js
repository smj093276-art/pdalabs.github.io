/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        railway: {
          darker: '#040711',
          dark: '#080E21',
          card: '#0D1633',
          cardHover: '#13214A',
          border: 'rgba(56, 189, 248, 0.2)',
          cyan: '#00E5FF',
          blue: '#2563EB',
          orange: '#FF9100',
          amber: '#F59E0B',
          green: '#00E676',
          red: '#EF4444',
          textMuted: '#94A3B8',
        }
      },
      boxShadow: {
        'glow-cyan': '0 0 20px rgba(0, 229, 255, 0.35)',
        'glow-orange': '0 0 20px rgba(255, 145, 0, 0.45)',
        'glow-green': '0 0 15px rgba(0, 230, 118, 0.35)',
        'glass': '0 8px 32px 0 rgba(0, 0, 0, 0.37)',
      },
      animation: {
        'pulse-slow': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
        'ping-slow': 'ping 2s cubic-bezier(0, 0, 0.2, 1) infinite',
        'train-glow': 'trainGlow 2s ease-in-out infinite alternate',
      },
      keyframes: {
        trainGlow: {
          '0%': { filter: 'drop-shadow(0 0 8px #FF9100)' },
          '100%': { filter: 'drop-shadow(0 0 18px #FFD600)' },
        }
      }
    },
  },
  plugins: [],
}

import js from '@eslint/js'
import react from 'eslint-plugin-react'
import globals from 'globals'

export default [
  js.configs.recommended,
  {
    files: ['**/*.{js,jsx,mjs,cjs}'],
    plugins: {
      react
    },
    languageOptions: {
      ecmaVersion: 'latest',
      sourceType: 'module',
      parserOptions: {
        ecmaFeatures: {
          jsx: true
        }
      },
      globals: {
        ...globals.browser,
        ...globals.es2021
      }
    },
    rules: {
      ...react.configs.recommended.rules
    },
    settings: {
      react: {
        version: 'detect'
      }
    }
  },
  {
    files: ['.eslintrc.{js,cjs}'],
    languageOptions: {
      sourceType: 'script',
      globals: {
        ...globals.node
      }
    }
  }
]

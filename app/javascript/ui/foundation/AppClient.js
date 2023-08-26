import App from './App'

const AppClient = (props, railsContext) => {
  return () => (
    App(props, railsContext)
  )
}

export default AppClient

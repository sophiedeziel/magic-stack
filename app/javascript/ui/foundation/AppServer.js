import ReactDOM from 'react-dom/server'
import App from './App'

// Hack to suppress warning
import React from 'react'
React.useLayoutEffect = React.useEffect

const ReactServerRenderer = (props, railsContext) => {
  const html = ReactDOM.renderToString(
    App(props, railsContext)
  )

  if (railsContext.url) {
    // Somewhere a `<Redirect>` was rendered
    // redirect(301, railsContext.url)
  } else {
    // we're good, send the response
    return { renderedHtml: html }
  }
}

export default (props, railsContext) => ReactServerRenderer(props, railsContext)

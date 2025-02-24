import React from 'react'

import {
  createBrowserRouter,
  RouterProvider,
  matchRoutes,
  createStaticRouter,
  createStaticHandler
} from 'react-router'

import Greeting from '../components/Greeting'

const routes = [
  { path: '/', Component: Greeting }
]

function Router (railsContext) {
  function createRouter () {
    if (railsContext?.serverSide || railsContext.serverSide === undefined) {
      const { dataRoutes } = createStaticHandler(routes)
      const matches = matchRoutes(routes, railsContext.location)

      return createStaticRouter(dataRoutes, { location: railsContext.location, matches })
    } else {
      return createBrowserRouter(routes)
    }
  }

  const router = createRouter()
  return (
    <RouterProvider router={router} />
  )
}

export default Router

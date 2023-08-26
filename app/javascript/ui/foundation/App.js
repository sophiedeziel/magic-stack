import PropTypes from 'prop-types'
import React from 'react'

import { ApolloClient, InMemoryCache, ApolloProvider } from '@apollo/client'

import Router from './Router'

function App (props, railsContext) {
  const client = new ApolloClient({
    uri: '/graphql',
    cache: new InMemoryCache(),
    ssrMode: railsContext.ssrMode
  })

  return (
    <ApolloProvider client={client}>
      <Router {...railsContext}/>
    </ApolloProvider>
  )
}

App.propTypes = {
  name: PropTypes.string // this is passed from the Rails view
}

export default App

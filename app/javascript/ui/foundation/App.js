import PropTypes from 'prop-types'
import React from 'react'

import { ApolloClient, InMemoryCache, HttpLink } from '@apollo/client'
import { ApolloProvider } from '@apollo/client/react'

import Router from './Router'

function App (props, railsContext) {
  const client = new ApolloClient({
    link: new HttpLink({ uri: '/graphql' }),
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

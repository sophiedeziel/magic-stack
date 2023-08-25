import PropTypes from 'prop-types'
import React from 'react'

import { ApolloClient, InMemoryCache, ApolloProvider } from '@apollo/client'

import Greeting from './components/Greeting'

const client = new ApolloClient({
  uri: '/graphql',
  cache: new InMemoryCache()
})

export default function App (props) {
  return (
    <ApolloProvider client={client}>
      <Greeting />
    </ApolloProvider>
  )
};

App.propTypes = {
  name: PropTypes.string // this is passed from the Rails view
}

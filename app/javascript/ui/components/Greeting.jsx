import React, { useState } from 'react'
import { bold, bright } from './Greeting.module.css'

import { useQuery, gql } from '@apollo/client'

const GET_TEST_STRING = gql`
  query TestField {
    testField
  }
`

export default function Greeting () {
  const [name, setName] = useState('')
  const { loading, error, data } = useQuery(GET_TEST_STRING, { ssr: true })

  if (loading) return <p>Loading...</p>
  if (error) return <p>Error : {error.message}</p>

  return (
    <div>
      <h3 className={bold}>{data.testField}, {name}!</h3>
      <hr />
      <form>
        <label className={bright} htmlFor="name">

          <input id="name" type="text" value={name} onChange={(e) => setName(e.target.value)} />
        </label>
      </form>
    </div>
  )
}

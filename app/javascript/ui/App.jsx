import PropTypes from 'prop-types'
import React, { useState } from 'react'
import style from './App.module.css'

export default function App (props) {
  const [name, setName] = useState(props.name)

  return (
    <div>
      <h3>Hello, {name}!</h3>
      <hr />
      <form>
        <label className={style.bright} htmlFor="name">
          Say hello to:
          <input id="name" type="text" value={name} onChange={(e) => setName(e.target.value)} />
        </label>
      </form>
    </div>
  )
};

App.propTypes = {
  name: PropTypes.string // this is passed from the Rails view
}

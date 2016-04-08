import React from 'react';
import Temperature from './dashboard/temperature';
import Controls from './dashboard/controls';
import Systems from './dashboard/controls';

export default React.createClass({
  render() {
    return(
      <div>
        <Temperature />
        <div>
          <Controls />
          <Systems />
        </div>
      </div>
    )
  }
})

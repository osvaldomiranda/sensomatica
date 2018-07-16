import React from "react"
import PropTypes from "prop-types"
class TelescopeStatus extends React.Component {
  
  
  render () {
    return (
      <React.Fragment>
        Status: {this.props.status}
      </React.Fragment>
    );
  }
}

TelescopeStatus.propTypes = {
  status: PropTypes.string
};
export default TelescopeStatus

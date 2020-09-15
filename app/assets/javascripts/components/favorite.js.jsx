import React from "react"
import PropTypes from "prop-types"

class Favorite extends Component {
  constructor(props) {
    super(props);
    this.like = this.like.bind(this);
  }
  like() {
    console.log('いいね！');
  }
  render() {
    return <button onClick={this.like}>Click Me</button>;
  }
}
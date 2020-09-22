class Star extends React.Component {
  constructor(props) {
    super(props)
    // いいねされたかどうかのステートを宣言
    this.state = {
      favorited: false,
    };
  }

  handClick() {
    this.setState({
    	favorited: !this.state.favorited/*squaresを反転した値*/
    });
  }

  render ()  {
  	const iconName = this.state.favorited ? 'far-star' : 'fa-star';
    return (
      <button onClick={this.handClick}>
        <i className={'far ${iconName}'}></i>
      </button>
    );
  }
}

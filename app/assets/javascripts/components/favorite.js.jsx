class Star extends React.Component {
  constructor(props) {
    super(props)
    // いいねされたかどうかのステートを宣言
    this.state = {
      iconClassName: null,
      favorited: false,
    };
  }

  handClick(i) {
  	const iconClassName = this.state.iconClassName.slice();
  	iconClassName[i] = this.state.favorited ? 'far-star' : 'fa-star';
    this.setState({
    	iconClassName: iconClassName,/*fa-starかfa-starかの現在値*/
    	favorited: !this.state.favorited/*squaresを反転した値*/
    });
  }

  render ()  {
    return (
      <button
        onClick={() => this.handClick(i)}>
        <i class={"far" + (this.state.favorited ? "far-star" : "fa-star")}></i>
      </button>
    );
  }
}

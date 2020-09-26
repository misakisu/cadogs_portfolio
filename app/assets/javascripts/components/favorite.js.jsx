class Star extends React.Component {
  constructor(props) {
    super(props)
    // いいねされたかどうかのステートを宣言
    this.state = {
    	iconClassName : 'far-star',
      favorited: false,
    };
  }

  handClick () {
    const iconClassName = this.state.favorited? 'far-star' : 'fa-star';
    this.setState({
    	iconClassName : iconClassName,/*現在の値を定義*/
    	favorited: !this.state.favorited/*現在の値を反転した値*/
    });
  }

  render ()  {
    return (
      <button onClick={() => this.handClick}>
        <i className={'far ' + (this.state.favorited? 'far-star' : 'fa-star')}></i>
      </button>
    );
  }
}



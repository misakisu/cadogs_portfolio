class Star extends React.Component {
  constructor(props) {
    super(props)
    console.log(props)
    // いいねされたかどうかのステートを宣言
    this.state = {
      favorited: false,
    };
  this.handleClick = this.handleClick.bind(this)/*starをthisとして使うためbind*/
  }

  handleClick () {
    this.setState({
     	favorited: !this.state.favorited/*現在の値を反転した値*/
    });
    $.ajax({
      url: this.props.url,/*Favorite CreateのURLへ*/
      type: "POST",
      dataType: 'json',
      cache: false,
      data: {hotel_id: this.props.hotel},
    })
  }

  render ()  {
    return (
      <button onClick={this.handleClick}>
        <i className={(this.state.favorited? 'fas fa-star' : 'far fa-star')}></i>
      </button>
    );
  }
}



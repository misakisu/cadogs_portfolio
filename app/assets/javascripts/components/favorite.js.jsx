class Star extends React.Component {
  constructor(props) {
    super(props)
    console.log(props)
    /* いいねされたかどうかのステートを宣言*/
    this.state = {
      favorited: this.props.favorited,/*hotel showページから@hotel.favorited_by?を受け取る*/
    };
  this.handleClick = this.handleClick.bind(this)/*starをthisとして使うためbind*/
  }

  handleClick () {
    this.setState({
     	favorited: !this.state.favorited/*現在の値を反転した値*/
    });
    if (favorited === false){
      $.ajax({
        url: this.props.url,/*Favorite CreateのURLへ*/
        type: "POST",
        dataType: 'json',
        cache: false,
        data: {hotel_id: this.props.hotel},
      })
    }
    else if (favorited === true){
      $.ajax({
        url: this.props.url,/*Favorite DeleteのURLへ*/
        type: "DELETE",
        dataType: 'json',
        cache: false,
        data: {hotel_id: this.props.hotel},
      })
    }
  }

  render ()  {
    return (
      <button onClick={this.handleClick}>
        <i className={(this.state.favorited? 'fas fa-star' : 'far fa-star')}></i>
      </button>
    );
  }
}



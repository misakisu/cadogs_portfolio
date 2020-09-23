class Star extends React.Component {
  ajaxMain: function(method){
        $.ajax({
          type: "POST",
          url: /hotels/favorite,                               //このURLは次でセットします
          dataType: 'json',
          data: {hotel_id: this.props.post},                  //このpostも次でセットします
            success: function(data) {
              if(data.like){                                 //ここはあとで活きてきます笑
                this.setState({is_favorited: data.favorited});     //responseのlikedをstateのis_likedに反映させます
              };
                this.setState({counts: data.counts});          //responseのcountsをstateのcountsにに反映させます
              }.bind(this),                                      //bindはthisが使えるようになるため
        });
    },

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

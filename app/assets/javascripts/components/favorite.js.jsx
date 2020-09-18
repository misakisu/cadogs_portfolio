class Favorite extends React.Component {

  ajaxMain() {
    alert("お気に入りに追加しました");
  }

  render ()  {
    return (
      <button onClick={this.ajaxMain}>
        <i class="far fa-star"></i>
      </button>
    );
  }
}
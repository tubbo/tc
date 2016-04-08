export default React.createClass({
  getInitialState() {
    return { degrees: 0 };
  }

  componentDidMount() {
    let channel = socket.channel('temperature:readings');
    channel.join();
    channel.on('report', params => this.setState(payload));
  }

  render() {
    return (
      <div id="temperature">
        <h1>{this.state.degrees} &deg; F</h1>
      </div>
    );
  }
})

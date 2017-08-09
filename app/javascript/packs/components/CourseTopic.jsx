import React from "react";

class CourseTopic extends React.Component {
  render() {
    return (
      <div className="topicContainer well">
        <div className="topicTitle">
          {this.props.topic.title}
        </div>
      </div>
    )
  }
}

export default CourseTopic;

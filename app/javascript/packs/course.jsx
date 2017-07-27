/* eslint no-console:0 */
import React from "react"
import ReactDOM from "react-dom";

class CourseTopics extends React.Component {
  render() {
    let topics = [];
    let a = "";

    for (a in ["1", "2"]) {
      topics.push(<CourseTopic n={a} />)
    }

    return (
      <h1>{ topics }</h1>
    );
  }
}

class CourseTopic extends React.Component {
  render() {
    return (
      <div className="well">
        I'm Topic number {this.props.n}
      </div>
    )
  }
}

ReactDOM.render(
  <CourseTopics />,
  document.getElementById("course-topics")
);

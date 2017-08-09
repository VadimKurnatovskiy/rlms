import React from "react";
import ReactDOM from "react-dom";
import CourseTopic from "./CourseTopic";

class CourseTopics extends React.Component {
  render() {
    return (
      <div className="courseTopics">
        { this.props.topics.map((topic) => <CourseTopic topic={topic} key={topic.id} />) }
      </div>
    );
  }
}

export default CourseTopics;

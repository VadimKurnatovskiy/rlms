import React from "react";
import ReactDOM from "react-dom";
import {SortableContainer, SortableElement, arrayMove} from 'react-sortable-hoc';

class SortableTopicsComponent extends React.Component {
  state = {
    topics: this.props.topics
  };

  onSortEnd = ({oldIndex, newIndex}) => {
    this.setState({
      topics: arrayMove(this.state.topics, oldIndex, newIndex),
    });
  };

  render() {
    return <CourseTopics topics={this.state.topics} onSortEnd={this.onSortEnd} />
  }
}

export default SortableTopicsComponent;

const CourseTopics = SortableContainer(({topics}) => {
  return (
    <div className="courseTopics">
      { topics.map((topic, index) => {
          return <CourseTopic topic={topic} key={topic.id} index={index} />
        })
      }
    </div>
  );
})

const CourseTopic = SortableElement(({topic}) => {
  return (
    <div className="topicContainer well">
      <div className="topicTitle">
        {topic.title}
      </div>
    </div>
  )
})


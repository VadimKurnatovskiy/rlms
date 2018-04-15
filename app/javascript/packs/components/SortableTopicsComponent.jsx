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

    this.state.topics.forEach((topic, order_index) => {
      $.ajax({
        url: "/api/v1/topics/" + topic.id,
        method: "PUT",
        data: {
          topic: {
            order_index: order_index
          }
        }
      });
    });
  };

  render() {
    return <CourseTopics topics={this.state.topics} pressDelay={200} onSortEnd={this.onSortEnd} />
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
    <div className="topicContainer sortableElement well">
      <div className="topicTitle pull-left">
        <h4>
          <a href={`/teachers/topics/${topic.slug}`}>{topic.title}</a>
        </h4>
      </div>
      <div className="topicActions pull-right">
        <h4>
          <a href={`/teachers/topics/${topic.slug}/edit`}>
            <span className='glyphicon glyphicon-pencil'></span>
          </a>
        </h4>
      </div>
      <div className="clearfix"></div>
      <span>Материалов: {topic.materials_count}</span>
    </div>
  )
})

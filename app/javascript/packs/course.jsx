/* eslint no-console:0 */
import React from "react"
import ReactDOM from "react-dom";
import SortableTopicsComponent from "./components/SortableTopicsComponent";

let topicsContainer = document.getElementById("course-topics-container")

$.ajax({
  url: '/api/v1/courses/' + topicsContainer.getAttribute('data-course-id') + '/topics',
  method: 'GET',
  success: function(data) {
    ReactDOM.render(
      <SortableTopicsComponent topics={data['topics']} />, topicsContainer
    );
  }
});



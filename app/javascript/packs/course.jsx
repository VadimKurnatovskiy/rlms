/* eslint no-console:0 */
import React from "react"
import ReactDOM from "react-dom";
import CourseTopics from "./components/CourseTopics";

let container = document.getElementById("courseTopicsContainer");
let topics = container.getAttribute("data-course-topics");

ReactDOM.render(
  <CourseTopics topics={ JSON.parse(topics) } />, container
);

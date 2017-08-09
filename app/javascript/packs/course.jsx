/* eslint no-console:0 */
import React from "react"
import ReactDOM from "react-dom";
import SortableTopicsComponent from "./components/SortableTopicsComponent";

let topicsContainer = document.getElementById("courseTopicsContainer")
let topics = JSON.parse(topicsContainer.getAttribute("data-course-topics"))

ReactDOM.render(
  <SortableTopicsComponent topics={topics} />, topicsContainer
);

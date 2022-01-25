// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";

function $$default(param) {
  var match = React.useState(function () {
        return "";
      });
  var setQuestion = match[1];
  var question = match[0];
  var match$1 = React.useState(function () {
        return [];
      });
  var setQArray = match$1[1];
  var qArray = match$1[0];
  var match$2 = React.useState(function () {
        return 0;
      });
  var questionChange = function (e) {
    return Curry._1(setQuestion, e.currentTarget.value);
  };
  return React.createElement(React.Fragment, undefined, React.createElement("div", {
                  className: "flex"
                }, React.createElement("div", {
                      className: "flex w-1/3"
                    }, React.createElement("div", {
                          style: {
                            display: "block",
                            position: "absolute"
                          }
                        }, "1. 문제 붙여 넣기"), React.createElement("textarea", {
                          style: {
                            border: "1px solid #333",
                            height: "700px",
                            marginTop: "30px",
                            width: "260px"
                          },
                          value: question,
                          onChange: questionChange
                        })), React.createElement("div", {
                      className: "w-2/3"
                    }, React.createElement("div", {
                          style: {
                            display: "block"
                          }
                        }, React.createElement("input", {
                              className: "storybook-button storybook-button--medium " + (
                                qArray.length === 0 ? "storybook-button--primary" : "storybook-button--secondary"
                              ),
                              style: {
                                display: "inline-block",
                                margin: "10px"
                              },
                              type: "button",
                              value: "2. Day3 문제읽기",
                              onClick: (function (param) {
                                  console.log("문제읽기");
                                  return Curry._1(setQArray, (function (param) {
                                                return question.split("\n");
                                              }));
                                })
                            }), React.createElement("input", {
                              className: "storybook-button storybook-button--medium " + (
                                qArray.length === 0 ? "storybook-button--secondary" : "storybook-button--primary"
                              ),
                              style: {
                                display: "inline-block",
                                margin: "10px"
                              },
                              disabled: qArray.length === 0,
                              type: "button",
                              value: "3. Day3 문제풀기 (파트1)",
                              onClick: (function (param) {
                                  console.log("문제풀이 (파트1)");
                                  
                                })
                            }), React.createElement("input", {
                              className: "storybook-button storybook-button--medium " + (
                                qArray.length === 0 ? "storybook-button--secondary" : "storybook-button--primary"
                              ),
                              style: {
                                display: "inline-block",
                                margin: "10px"
                              },
                              disabled: qArray.length === 0,
                              type: "button",
                              value: "3. Day3 문제풀기 (파트2)",
                              onClick: (function (param) {
                                  console.log("문제풀이 (파트2)");
                                  
                                })
                            })), React.createElement("div", undefined, "4. 답은", React.createElement("input", {
                              style: {
                                display: "inline-block",
                                margin: "10px",
                                textAlign: "center",
                                width: "200px"
                              },
                              readOnly: true,
                              value: match$2[0].toString()
                            }), "입니다."))));
}

export {
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */

/*
* 리액트 + 자바스크립트
 */
import React, {useState} from 'react';

export const Day3Q = () => {
    const [question, setQuestion] = useState("");
    const [qArray, setQArray] = useState([]);
    const [answer, setAnswer] = useState(0);

    const questionChange = (e) => {
        setQuestion(e.target.value);
    }

    const handleOnClick = () => {
        console.log("문제읽기");
        let text = question;
        setQArray(text.split("\n"));
    }

    const handleOnClick2 = () => {
        console.log("문제풀이(파트1)");
        // yes 라고 대답이된 질문의 개수를 그룹별로 구해서 합치기
        let tempArray = [];
        let tempStr = "";
        let cal = 0;
        for(let i = 0; i < qArray.length; i++){
            if(qArray[i] !== ""){ // 그룹 구분이 오기 전까지
                tempStr += qArray[i];
            }else { // 그룹 구분이 오면
                tempArray.push(tempStr); // 대답들이 그룹끼리 구분되어 합쳐진 새로운 배열
                tempStr = "";
            }
        }
        tempArray.push(tempStr); // 마지막 그룹 추가
        for(let i = 0; i<tempArray.length; i++){
            let tempStr = "";
            for(let j = 0; j<tempArray.length; j++){
                if(j === tempArray[i].indexOf(tempArray[i][j])) { // 중복 제거 - 첫번째 인덱스일때
                    tempStr += tempArray[i][j];
                }
            }
            // tempArray[i] = tempStr;
            cal += tempStr.length;
        }
        setAnswer(cal);
    }

    const handleOnClick3 = () => {
        console.log("문제풀이(파트2)");
        // 모든 사람이 yes 라고 대답한 질문의 개수만 그룹별로 구해서 합치기
        let tempArray = [];
        let tempStr = "";
        let cal = 0;
        let count = 0; // 그룹내에 몇명이 속해 있는지
        for(let i = 0; i < qArray.length; i++){
            if(qArray[i] !== ""){ // 그룹 구분이 오기 전까지
                tempStr += qArray[i];
                count ++;
            }else { // 그룹 구분이 오면
                tempArray.push([tempStr,count]);
                tempStr = "";
                count = 0;
            }
        }
        tempArray.push([tempStr,count]); // 마지막 그룹 추가
        let countArray = [];
        for(let i = 0; i<tempArray.length; i++){
            for(let j = 0; j<tempArray.length; j++){
                if(j === tempArray[i][0].indexOf(tempArray[i][0][j])) { // 중복 제거 - 첫번째 인덱스일때
                    let regexp = new RegExp(tempArray[i][0][j], "g")
                    countArray = tempArray[i][0].match(regexp); // 해당 대답이 그룹에서 몇개 나왔는지 체크할 배열
                    cal += tempArray[i][1] === countArray.length ? 1 : 0; // 그룹의 인원수와 해당 대답의 개수가 같을때만 1을 더함
                }
            }
        }
        setAnswer(cal);
    }

    return (
        <div className={"flex"}>
            <div className={"flex w-1/3"}>
                <div style={{display: "block", position: "absolute"}}>1. 문제 붙여 넣기</div>
                <textarea
                    style={{
                        marginTop: "30px",
                        height: "700px",
                        width: "260px",
                        border: "1px solid #333"
                    }}
                    value={question}
                    onChange={(e) => {questionChange(e)}}
                />
            </div>
            <div className={"w-2/3"}>
                <div style={{display: "block"}}>
                    <input
                        className={"storybook-button storybook-button--medium " + (
                            qArray.length === 0
                                ? "storybook-button--primary"
                                : "storybook-button--secondary"
                        )}
                        type="button"
                        style={{display: "inline-block", margin:"10px"}}
                        value={"2. Day6 문제읽기"}
                        onClick={() => { handleOnClick() }}
                    />
                    <input
                        className={"storybook-button storybook-button--medium " + (
                            qArray.length === 0
                                ? "storybook-button--secondary"
                                : "storybook-button--primary"
                        )}
                        type="button"
                        style={{display: "inline-block", margin:"10px"}}
                        disabled={qArray.length === 0}
                        value={"3. Day6 문제풀기 (파트1)"}
                        onClick={() => { handleOnClick2() }}
                    />
                    <input
                        className={"storybook-button storybook-button--medium " + (
                            qArray.length === 0
                                ? "storybook-button--secondary"
                                : "storybook-button--primary"
                        )}
                        type="button"
                        style={{display: "inline-block", margin:"10px"}}
                        disabled={qArray.length === 0}
                        value={"3. Day6 문제풀기 (파트2)"}
                        onClick={() => { handleOnClick3() }}
                    />
                </div>
                <div>
                    4. 답은
                    <input
                        type={"text"}
                        readOnly={true}
                        style={{
                            display: "inline-block",
                            textAlign: "center",
                            width: "200px",
                            margin: "10px"}}
                        value={answer}/>
                    입니다.
                </div>
            </div>
        </div>)
}

export default Day3Q;

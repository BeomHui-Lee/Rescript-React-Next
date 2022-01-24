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
        console.log("문제풀이");
        // setQuestion(totalString);
        // setAnswer(count);
    }

    return (
        <div className={"flex"}>
            <div className={"flex w-1/2"}>
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
            <div className={"w-1/2"}>
                <div style={{display: "block"}}>
                    <input
                        className={"storybook-button storybook-button--medium " + (
                            qArray.length === 0
                            ? "storybook-button--primary"
                            : "storybook-button--secondary"
                        )}
                        type="button"
                        style={{display: "inline-block", margin:"10px"}}
                        value={"2. Day3 문제읽기"}
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
                        value={"3. Day3 문제풀기"}
                        onClick={() => { handleOnClick2() }}
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
                            width: "40px",
                            margin: "10px"}}
                        value={answer}/>
                    입니다.
                </div>
            </div>
        </div>)
}

export default Day3Q;

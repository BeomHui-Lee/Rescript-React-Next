import React, {useState} from 'react';

export const Day1Q = () => {
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
        console.log("문제풀이 (파트1)");
        for(let i = 0; i < qArray.length; i++){
            for(let j = 0; j< qArray.length; j++) {
                if(Number(qArray[i]) + Number(qArray[j]) === 2020){
                    setAnswer(Number(qArray[i]) * Number(qArray[j]));
                    return;
                }
            }
        }
    }

    const handleOnClick3 = () => {
        console.log("문제풀이 (파트2)");
        for(let i = 0; i < qArray.length; i++){
            for(let j = 0; j< qArray.length; j++) {
                for (let k = 0; k < qArray.length; k++) {
                    if (Number(qArray[i]) + Number(qArray[j]) + Number(qArray[k]) === 2020) {
                        setAnswer(Number(qArray[i]) * Number(qArray[j]) * Number(qArray[k]));
                        return;
                    }
                }
            }
        }
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
                        value={"2. Day1 문제읽기"}
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
                        value={"3. Day1 문제풀기 (파트1)"}
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
                        value={"3. Day1 문제풀기 (파트2)"}
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

export default Day1Q;

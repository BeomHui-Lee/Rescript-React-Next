import React, {useState} from 'react';

export const Day5Q = () => {
    const [question, setQuestion] = useState("");
    const [qArray, setQArray] = useState([]);
    const [answer, setAnswer] = useState(0);
    const [seat, setSeat] = useState([]);

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
        let min = 0, max = 127;
        let seatID = 0;
        let higestSeatID = 0;
        let seatArray = [];
        for(let i = 0; i < qArray.length; i++) {
            for(let j = 0; j < qArray[i].length; j++) {
                if(j < 7){
                    if(qArray[i][j] === "F"){
                        max = max - (((max-min)+1) / 2);
                    }else{
                        min = (((max-min)+1) / 2) + min;
                    }
                } else {
                    if(j === 7){
                        seatID = min * 8;
                        min = 0;
                        max = 7;
                    }
                    if(qArray[i][j] === "L"){
                        max = max - (((max-min)+1) / 2);
                    }else{
                        min = (((max-min)+1) / 2) + min;
                    }
                }
            }
            seatID += min;
            seatArray.push(seatID);
            if(higestSeatID < seatID){
                higestSeatID = seatID;
            }
            min = 0;
            max = 127;
        }
        // console.log(higestSeatID)
        setAnswer(higestSeatID);
        setSeat(seatArray);
    }

    const handleOnClick3 = async () => {
        console.log("문제풀이 (파트2)");
        let tempArray = seat;
        tempArray.sort((a, b) => {return a - b;})
        for(let i =1; i<tempArray.length; i++){
            if(tempArray[i] !== (tempArray[i-1])+1){
                setAnswer(tempArray[i] - 1);
                return;
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
                        value={"2. Day5 문제읽기"}
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
                        value={"3. Day5 문제풀기 (파트1)"}
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
                        value={"3. Day5 문제풀기 (파트2)"}
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

export default Day5Q;

import React, {useState} from 'react';
import {NewButton} from "../stories/NewButton";
import day5txt from "../aoc2020/day5.txt";

export const Day5Q = () => {
    const [question, setQuestion] = useState("");
    const [qArray, setQArray] = useState([]);
    const [answer, setAnswer] = useState(0);
    const [seat, setSeat] = useState([]);

    const handleOnClick = () => {
        fetch(day5txt)
            .then(r => r.text())
            .then(text => {
                setQuestion(text);
                let tempArray = [];
                tempArray = text.split("\n");
                setQArray(tempArray);
            });
    }

    const handleOnClick2 = () => {
        let x = 0, y = 0; //행, 열
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
        <div>
            <div style={{display: "block"}}>
                <NewButton style={{display: "inline-block", margin:"10px"}} label={"Day5 문제보기"} onClick={() => { handleOnClick() }}/>
                <NewButton primary={true} style={{display: "inline-block", margin:"10px"}} label={"Day5 문제풀기 (파트1)"} onClick={() => { handleOnClick2() }}/>
                <NewButton primary={true} style={{display: "inline-block", margin:"10px"}} label={"Day5 문제풀기 (파트2)"} onClick={() => { handleOnClick3() }}/>
            </div>
            <textarea style={{height: "700px", width: "260px"}} readOnly={true} value={question} />
            <div>
                답은
                <input
                    type={"text"}
                    readOnly={true}
                    style={{display: "inline-block",  textAlign: "center", width: "200px", margin: "10px"}}
                    value={answer}/>
                입니다.
            </div>
        </div>)
}

export default Day5Q;

/*
* 리액트 + 자바스크립트
 */
import React, {useState} from 'react';

export const Day3Q = () => {
    const [question, setQuestion] = useState("");
    const [qArray, setQArray] = useState([]);
    const [move, changeMove] = useState({x: 3, y: 1});
    const [num, changeNum] = useState(31);
    const [answer, setAnswer] = useState(0);

    const questionChange = (e) => {
        setQuestion(e.target.value);
    }

    const handleOnClick = () => {
        let text = question;
        changeNum(text.indexOf("\n")); // 한 줄마다 문자가 몇개씩 있는지
        setQArray(text.split("\n"));
    }

    const handleOnClick2 = () => {
        let tempX = 0; //우측으로 이동하는 값을 체크하는 변수
        let tempArray = [...qArray];
        let totalString = tempArray[0] + "\n";
        let count = 0; // X 개수가 몇개인지 카운트

        for(let i = 1; i <qArray.length; i++){
            if(((i % move.y) === 0)){ //아래쪽으로 몇칸 갈때마다 체크할지
                tempX += move.x;
                tempX = tempX > (num-1) ? tempX - num : tempX;
                let s = tempArray[i];
                if(s[tempX] === "#") {
                    s = s.substring(0,tempX) + "X" + s.substring(tempX+1,num);
                    count++;
                }else{
                    s = s.substring(0,tempX) + "O" + s.substring(tempX+1,num);
                }
                tempArray[i] = s;
            }
            totalString += tempArray[i] + "\n";
        }
        setQuestion(totalString);
        setAnswer(count);
    }

    return (
        <div className={"flex"}>
            <div className={"flex w-1/3"}>
                <textarea style={{height: "700px", width: "260px", border: "1px solid #333"}} value={question} onChange={(e) => {questionChange(e)}}/>
            </div>
            <div className={"w-2/3"}>
                <div style={{display: "block"}}>
                    <input type="button" style={{display: "inline-block", margin:"10px"}} value={"Day3 문제읽기"} onClick={() => { handleOnClick() }}/>
                    <input type="button" style={{display: "inline-block", margin:"10px"}} value={"Day3 문제풀기"} disabled={question===""} onClick={() => { handleOnClick2() }}/>
                </div>
                {/*<div>*/}
                {/*    오른쪽으로*/}
                {/*    <input*/}
                {/*        type={"text"}*/}
                {/*        style={{display: "inline-block", textAlign: "center", width: "40px", margin: "10px"}}*/}
                {/*        value={move.x}*/}
                {/*        onChange={*/}
                {/*            (e) => {*/}
                {/*                changeMove({x: Number(e.target.value), y: move.y})*/}
                {/*            }}/>*/}
                {/*    칸, 아래쪽으로*/}
                {/*    <input*/}
                {/*        type={"text"}*/}
                {/*        style={{display: "inline-block",  textAlign: "center", width: "40px", margin: "10px"}}*/}
                {/*        value={move.y}*/}
                {/*        onChange={*/}
                {/*            (e) => {*/}
                {/*                changeMove({x: move.x, y: Number(e.target.value)})*/}
                {/*            }}/>*/}
                {/*    칸씩 이동*/}
                {/*</div>*/}
                <div>
                    답은
                    <input
                        type={"text"}
                        readOnly={true}
                        style={{display: "inline-block",  textAlign: "center", width: "40px", margin: "10px"}}
                        value={answer}/>
                    개 입니다.
                </div>
            </div>
        </div>)
}

export default Day3Q;

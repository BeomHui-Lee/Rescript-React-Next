let default = () => {
  let (question, setQuestion) = React.useState(_ => "")
  let (qArray, setQArray) = React.useState(_ => [])
  let (move, changeMove) = React.useState(_ => {"x": 3, "y": 1})
  let (num, changeNum) = React.useState(_ => 31)
  let (answer, setAnswer) = React.useState(_ => 0)

  let questionChange = e => {
    setQuestion(ReactEvent.Form.currentTarget(e)["value"])
  }

  let handleOnClick = () => {
    let text = question
    changeNum(_ => Js.String2.indexOf(text, "\n")) // 한 줄마다 문자가 몇개씩 있는지
    setQArray(_ => Js.String2.split(text, "\n"))
  }

  let handleOnClick2 = () => {
    let tempX = ref(0) //우측으로 이동하는 값을 체크하는 변수
    let tempArray = qArray
    let totalString = ref(tempArray[0] ++ "\n")
    let count = ref(0) // X 개수가 몇개인지 카운트

    for i in 1 to qArray->Belt.Array.length - 1 {
      if mod(i, move["y"]) === 0 {
        //아래쪽으로 몇칸 갈때마다 체크할지
        tempX := tempX.contents + move["x"]
        tempX.contents > num - 1 ? tempX := tempX.contents - num : tempX := tempX.contents
        let s = ref(tempArray[i])

        switch Js.String2.substrAtMost(s.contents, ~from=tempX.contents, ~length=1) {
        | "#" =>
          s :=
            Js.String2.substrAtMost(s.contents, ~from=0, ~length=tempX.contents) ++
            "X" ++
            Js.String2.substrAtMost(s.contents, ~from=tempX.contents + 1, ~length=num)
          count := count.contents + 1
        | "." =>
          s :=
            Js.String2.substrAtMost(s.contents, ~from=0, ~length=tempX.contents) ++
            "O" ++
            Js.String2.substrAtMost(s.contents, ~from=tempX.contents + 1, ~length=num)
        | _ => Js.log(s)
        }
        tempArray[i] = s.contents
      }
      totalString := totalString.contents ++ tempArray[i] ++ "\n"
    }
    setQuestion(_ => totalString.contents)
    setAnswer(_ => count.contents)
  }

  <>
    <div className={"flex"}>
      <div className={"flex w-1/2"}>
        <textarea
          style={ReactDOM.Style.make(~height="700px", ~width="260px", ~border="1px solid #333", ())}
          value={question}
          onChange={questionChange}
        />
      </div>
      <div className={"w-1/2"}>
        <div style={ReactDOM.Style.make(~display="block", ())}>
          <input
            type_="button"
            style={ReactDOM.Style.make(~display="inline-block", ~margin="10px", ())}
            onClick={_ => handleOnClick()}
            value={`Day3 문제읽기`}
          />
          <input
            type_="button"
            style={ReactDOM.Style.make(~display="inline-block", ~margin="10px", ())}
            disabled={question === "" && qArray === []}
            onClick={_ => handleOnClick2()}
            value={`Day3 문제풀기`}
          />
        </div>
        <div>
          {`답은`->React.string}
          <input
            readOnly={true}
            style={ReactDOM.Style.make(
              ~display="inline-block",
              ~textAlign="center",
              ~width="40px",
              ~margin="10px",
              (),
            )}
            value={Js.Int.toString(answer)}
          />
          {`개 입니다.`->React.string}
        </div>
      </div>
    </div>
  </>
}

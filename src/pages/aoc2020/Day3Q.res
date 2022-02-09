/*
 * 리액트 + 리스크립트
 */
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
    Js.log(`문제읽기`)
    let text = question
    changeNum(_ => Js.String2.indexOf(text, "\n")) // 한 줄마다 문자가 몇개씩 있는지
    setQArray(_ => Js.String2.split(text, "\n"))
  }

  let handleOnClick2 = () => {
    Js.log(`문제풀이 (파트1)`)
    let tempX = ref(0) //우측으로 이동하는 값을 체크하는 변수
    let tempArray = qArray
    let count = ref(0) // X 개수가 몇개인지 카운트

    //    Belt.Array.map(qArray, x => Js.Array2.push(tt, x[1]))

    for i in 1 to qArray->Belt.Array.length - 1 {
      if mod(i, move["y"]) === 0 {
        //아래쪽으로 몇칸 갈때마다 체크할지
        tempX := tempX.contents + move["x"]
        tempX.contents > num - 1 ? tempX := tempX.contents - num : tempX := tempX.contents
        let s = ref(tempArray[i])

        switch Js.String2.substrAtMost(s.contents, ~from=tempX.contents, ~length=1) {
        | "#" => count := count.contents + 1
        | _ => Js.log(s)
        }
        tempArray[i] = s.contents
      }
    }
    setAnswer(_ => count.contents)
  }

  let handleOnClick3 = () => {
    Js.log(`문제풀이 (파트2)`)
    let tempX = ref(0)
    let count = ref(0)
    let moveArray = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
    let countArray = []

    for j in 0 to Belt.Array.length(moveArray) - 1 {
      for i in 1 to Belt.Array.length(qArray) - 1 {
        switch mod(i, moveArray[j][1]) {
        | 0 =>
          tempX := tempX.contents + moveArray[j][0]
          if tempX.contents > num - 1 {
            tempX := tempX.contents - num
          }
          if Js.String2.substrAtMost(qArray[i], ~from=tempX.contents, ~length=1) === "#" {
            count := count.contents + 1
          }
        | _ => Js.log(`etc`)
        }
      }
      tempX := 0
      let _ = Js.Array2.push(countArray, count.contents)
      count := 0
    }
  }

  <>
    <div className={"flex"}>
      <div className={"flex w-1/3"}>
        <div style={ReactDOM.Style.make(~display="block", ~position="absolute", ())}>
          {`1. 문제 붙여 넣기`->React.string}
        </div>
        <textarea
          style={ReactDOM.Style.make(
            ~marginTop="30px",
            ~height="700px",
            ~width="260px",
            ~border="1px solid #333",
            (),
          )}
          value={question}
          onChange={questionChange}
        />
      </div>
      <div className={"w-2/3"}>
        <div style={ReactDOM.Style.make(~display="block", ())}>
          <input
            className={"storybook-button storybook-button--medium " ++ (
              qArray->Belt.Array.length === 0
                ? "storybook-button--primary"
                : "storybook-button--secondary"
            )}
            type_="button"
            style={ReactDOM.Style.make(~display="inline-block", ~margin="10px", ())}
            onClick={_ => handleOnClick()}
            value={`2. Day3 문제읽기`}
          />
          <input
            className={"storybook-button storybook-button--medium " ++ (
              qArray->Belt.Array.length === 0
                ? "storybook-button--secondary"
                : "storybook-button--primary"
            )}
            type_="button"
            style={ReactDOM.Style.make(~display="inline-block", ~margin="10px", ())}
            disabled={qArray->Belt.Array.length === 0}
            onClick={_ => handleOnClick2()}
            value={`3. Day3 문제풀기 (파트1)`}
          />
          <input
            className={"storybook-button storybook-button--medium " ++ (
              qArray->Belt.Array.length === 0
                ? "storybook-button--secondary"
                : "storybook-button--primary"
            )}
            type_="button"
            style={ReactDOM.Style.make(~display="inline-block", ~margin="10px", ())}
            disabled={qArray->Belt.Array.length === 0}
            value={`3. Day3 문제풀기 (파트2)`}
            onClick={_ => handleOnClick3()}
          />
        </div>
        <div>
          {`4. 답은`->React.string}
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

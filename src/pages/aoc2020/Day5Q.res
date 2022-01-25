/*
 * 리액트 + 리스크립트
 */
let default = () => {
  let (question, setQuestion) = React.useState(_ => "")
  let (qArray, setQArray) = React.useState(_ => [])
  let (answer, setAnswer) = React.useState(_ => 0)
  let (seat, setSeat) = React.useState(_ => [])

  let questionChange = e => {
    setQuestion(ReactEvent.Form.currentTarget(e)["value"])
  }

  let handleOnClick = () => {
    Js.log(`문제읽기`)
    let text = question
    setQArray(_ => Js.String2.split(text, "\n"))
  }

  let handleOnClick2 = () => {
    Js.log(`문제풀이 (파트1)`)
    let min = ref(0)
    let max = ref(127)
    let seatID = ref(0)
    let higestSeatID = ref(0)
    let seatArray = []
    for i in 0 to Belt.Array.length(qArray) - 1 {
      for j in 0 to Js.String2.length(qArray[i]) - 1 {
        switch j {
        | _ if j < 7 =>
          switch Js.String2.substrAtMost(qArray[i], ~from=j, ~length=1) {
          | "F" => max := max.contents - (max.contents - min.contents + 1) / 2
          | _ => min := (max.contents - min.contents + 1) / 2 + min.contents
          }
        | _ =>
          if j === 7 {
            seatID := min.contents * 8
            min := 0
            max := 7
          }
          switch Js.String2.substrAtMost(qArray[i], ~from=j, ~length=1) {
          | "L" => max := max.contents - (max.contents - min.contents + 1) / 2
          | _ => min := (max.contents - min.contents + 1) / 2 + min.contents
          }
        }
      }
      seatID := seatID.contents + min.contents
      let _ = Js.Array2.push(seatArray, seatID.contents)
      if higestSeatID.contents < seatID.contents {
        higestSeatID := seatID.contents
      }
      min := 0
      max := 127
    }
    setAnswer(_ => higestSeatID.contents)
    setSeat(_ => seatArray)
  }

  let handleOnClick3 = () => {
    Js.log(`문제풀이 (파트2)`)
    let min = ref(0)
    let max = ref(127)
    let seatID = ref(0)
    let higestSeatID = ref(0)
    let seatArray = []
    for i in 0 to Belt.Array.length(qArray) - 1 {
      for j in 0 to Js.String2.length(qArray[i]) - 1 {
        switch j {
        | _ if j < 7 =>
          switch Js.String2.substrAtMost(qArray[i], ~from=j, ~length=1) {
          | "F" => max := max.contents - (max.contents - min.contents + 1) / 2
          | _ => min := (max.contents - min.contents + 1) / 2 + min.contents
          }
        | _ =>
          if j === 7 {
            seatID := min.contents * 8
            min := 0
            max := 7
          }
          switch Js.String2.substrAtMost(qArray[i], ~from=j, ~length=1) {
          | "L" => max := max.contents - (max.contents - min.contents + 1) / 2
          | _ => min := (max.contents - min.contents + 1) / 2 + min.contents
          }
        }
      }
      seatID := seatID.contents + min.contents
      let _ = Js.Array2.push(seatArray, seatID.contents)
      if higestSeatID.contents < seatID.contents {
        higestSeatID := seatID.contents
      }
      min := 0
      max := 127
    }

    let tempArray = seatArray
    let _ = Js.Array.sortInPlaceWith((a, b) => a - b, tempArray)
    for i in 1 to Belt.Array.length(tempArray) - 1 {
      if tempArray[i] !== tempArray[i - 1] + 1 {
        setAnswer(_ => tempArray[i] - 1)
      }
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
            value={`2. Day5 문제읽기`}
            onClick={_ => handleOnClick()}
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
            value={`3. Day5 문제풀기 (파트1)`}
            onClick={_ => handleOnClick2()}
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
            value={`3. Day5 문제풀기 (파트2)`}
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
              ~width="200px",
              ~margin="10px",
              (),
            )}
            value={Js.Int.toString(answer)}
          />
          {`입니다.`->React.string}
        </div>
      </div>
    </div>
  </>
}

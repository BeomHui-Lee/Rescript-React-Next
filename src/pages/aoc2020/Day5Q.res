/*
 * 리액트 + 리스크립트
 */
// -------------------------------------------------------------------------------------
// ----- 문제 읽어오기 -----
// let text = Node.Fs.readFileAsUtf8Sync("input/Week1/Year2020Day5.txt")

let part2 = arr => {
  let firstSeat = arr[0] - 1
  arr->Belt.Array.reduce(firstSeat, (prev, next) => {
    switch next === prev + 1 {
    | true => prev + 1
    | false => prev
    }
  }) + 1
}

let part1 = arr => {
  arr[Belt.Array.length(arr) - 1]
}

let makeSeatID = arr => {
  arr->Belt.Array.reduceWithIndex(0, (acc, x, i) => {
    let exp = Belt.Array.length(arr) - (i + 1)
    let increment = Js.Math.pow_int(~base=2, ~exp)
    acc + x * increment
    // acc + x + i
  })
}
// :: [0,0,1,0,0,0,1,1,1,0] -> [142]

let convertBinary = char => {
  switch char {
  | "B" | "R" => 1
  | _ => 0
  }
}

let convertArray = str => {
  str->Js.String2.split("")->Belt.Array.map(char => convertBinary(char))
}
// :: "BFFFBBFLRR" -> ["B","F","F","F","B"...] -> [1,0,0,0,1,...]

let makeArray = input => {
  input->Js.String2.split("\n")
}
// :: ["BFFFBBFLRR", "FBBBFFFRLR", ...]

let program = input => {
  input->makeArray->Belt.Array.map(str => convertArray(str))->Belt.Array.map(arr => makeSeatID(arr))
}

let result = (input, f) => {
  ((a, b) => a - b)->Js.Array.sortInPlaceWith(program(input))->f
  //->Js.log
}

// result(text, part1)
// result(text, part2)

// -------------------------------------------------------------------------------------

let default = () => {
  let (question, setQuestion) = React.useState(_ => "")
  let (answer, setAnswer) = React.useState(_ => 0)

  let questionChange = e => {
    setQuestion(ReactEvent.Form.currentTarget(e)["value"])
    Js.log(`문제 붙여넣기 완료`)
  }

  let handleOnClick = () => {
    Js.log(`클리어`)
    setQuestion(_ => "")
    setAnswer(_ => 0)
  }

  let handleOnClick2 = () => {
    Js.log(`문제풀이 (파트1)`)
    setAnswer(_ => question->result(part1))
  }

  let handleOnClick3 = () => {
    Js.log(`문제풀이 (파트2)`)
    setAnswer(_ => question->result(part2))
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
              question->Js.String2.length === 0
                ? "storybook-button--secondary"
                : "storybook-button--primary"
            )}
            type_="button"
            style={ReactDOM.Style.make(~display="inline-block", ~margin="10px", ())}
            disabled={question->Js.String2.length === 0}
            value={`2. Day5 문제풀기 (파트1)`}
            onClick={_ => handleOnClick2()}
          />
          <input
            className={"storybook-button storybook-button--medium " ++ (
              question->Js.String2.length === 0
                ? "storybook-button--secondary"
                : "storybook-button--primary"
            )}
            type_="button"
            style={ReactDOM.Style.make(~display="inline-block", ~margin="10px", ())}
            disabled={question->Js.String2.length === 0}
            value={`2. Day5 문제풀기 (파트2)`}
            onClick={_ => handleOnClick3()}
          />
          <input
            className={"storybook-button storybook-button--medium " ++ (
              answer !== 0 ? "storybook-button--primary" : "storybook-button--secondary"
            )}
            type_="button"
            style={ReactDOM.Style.make(~display="inline-block", ~margin="10px", ())}
            value={`클리어`}
            onClick={_ => handleOnClick()}
          />
        </div>
        <div>
          {`답은`->React.string}
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

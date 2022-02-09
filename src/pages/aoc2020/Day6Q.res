/*
 * 리액트 + 리스크립트
 */
// -------------------------------------------------------------------------------------
// ----- 문제 읽어오기 -----
// let text = Node.Fs.readFileAsUtf8Sync("input/Week1/Year2020Day6.txt")

let plus = (x, y) => x + y
let sum = xs => xs->Belt.Array.reduce(0, (total, curr) => plus(total, curr))
// xs :: [1,2,3,4]
// 0 + (1 + 2 + 3 + 4)
// plus(plus(plus(0, 1), 2), 3)

// xs :: []
// 0

let mult = xs => xs->Belt.Array.reduce(1, (total, curr) => total * curr)

let initSet = Js.String2.split("abcdefghijklmnopqrstuvwxyz", "")->Belt.Set.String.fromArray

// multiLineToSet :: String => Belt.Set.String
let f = (str, init, op) => {
  str
  ->Js.String2.split("\n")
  ->Belt.Array.map(s => Js.String2.split(s, ""))
  ->Belt.Array.map(arr => Belt.Set.String.fromArray(arr)) //array<set<string>>
  ->Belt.Array.reduce(init, (prev, current) => op(prev, current))
}

// | = union
// a | a | b | c | d => abcd
let multiLineToSet = str => str->f([]->Belt.Set.String.fromArray, Belt.Set.String.union)

let multiLineToSet2 = str => str->f(initSet, Belt.Set.String.intersect)

let allToGroup = str => {
  str->Js.String2.split("\n\n")
}

let program = (input, f) => {
  allToGroup(input)->Belt.Array.map(f)->Belt.Array.map(Belt.Set.String.size)->sum
}

let part1 = input => {
  program(input, multiLineToSet)
}

let part2 = input => {
  program(input, multiLineToSet2)
}

// part1(text)
// part2(text)

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
    setAnswer(_ => question->part1)
  }

  let handleOnClick3 = () => {
    Js.log(`문제풀이 (파트2)`)
    setAnswer(_ => question->part2)
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
            value={`2. Day6 문제풀기 (파트1)`}
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
            value={`2. Day6 문제풀기 (파트2)`}
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

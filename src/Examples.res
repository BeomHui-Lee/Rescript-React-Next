let day3txt = `..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#`

type props = {msg: string}

let default = (props: props) => {
  let (question, setQuestion) = React.useState(_ => "")
  let (qArray, setQArray) = React.useState(_ => [])
  let (num, changeNum) = React.useState(_ => 11)

  // 타입 선언
  //  let length: t => int

  let handleOnClick = () => {
    Js.log(`문제가져오기 로직`->React.string)
    let text = ref(day3txt)
    setQuestion(_ => day3txt)
    let tempArray = []
    text := Js.String2.replace(text.contents, "\n", "")
    let lengthCount = Js.String2.length(text.contents)
    for i in 0 to lengthCount {
      let _ = Js.Array2.push(
        tempArray,
        Js.String2.substrAtMost(text.contents, ~from=0, ~length=num),
      )
      text := Js.String2.substrAtMost(text.contents, ~from=num, ~length=lengthCount)
    }
    setQArray(_ => tempArray)
  }
  let handleOnClick2 = question => {
    Js.log(`문제풀기 로직`->React.string)
    Js.log(question->React.string)

    let tempX = ref(0)
  }

  let onChange = evt => {
    ReactEvent.Form.preventDefault(evt)
    let value = ReactEvent.Form.target(evt)["value"]
    setQuestion(_prev => value)
  }

  <>
    <div>
      <button onClick={_ => handleOnClick()}> {`Day3 문제보기`->React.string} </button>
      <button onClick={_ => handleOnClick2(question)}> {`Day3 문제풀기`->React.string} </button>
      <div />
      <textarea
        style={ReactDOM.Style.make(~height="700px", ~width="260px", ())} onChange value=question
      />
    </div>
  </>
}

let getServerSideProps = _ctx => {
  let props = {
    msg: `코드 작성`,
  }
  Js.Promise.resolve({"props": props})
}

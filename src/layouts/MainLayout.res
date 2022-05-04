module Link = Next.Link

module Navigation = {
  @react.component
  let make = () =>
    <nav
      className=%twc("p-2 h-12 flex border-b border-gray-200 justify-between items-center text-sm")>
      <Link href="/">
        <a className=%twc("flex items-center w-2/3")>
          <span className=%twc("text-xl ml-2 align-middle font-semibold")>
            {React.string("Next")}
            <span className=%twc("text-orange-500")> {React.string(" + ReScript")} </span>
            <span className=%twc("text-blue-400")> {React.string(" + React")} </span>
            <span className=%twc("text-purple-400")> {React.string(" + TailwindCss")} </span>
            <span className=%twc("text-green-400")> {`> 브이하우스`->React.string} </span>
          </span>
        </a>
      </Link>
      <div className=%twc("flex w-1/3 justify-end")>
        <Link href="/"> <a className=%twc("px-3")> {`메인`->React.string} </a> </Link>
        <Link href="/step01"> <a className=%twc("px-3")> {`클론코딩`->React.string} </a> </Link>
        <Link href="/aoc2020"> <a className=%twc("px-3")> {`AOC문제`->React.string} </a> </Link>
      </div>
    </nav>
}

@react.component
let make = (~children) => {
  let minWidth = ReactDOM.Style.make(~minWidth="20rem", ())
  <div style=minWidth className=%twc("flex lg:justify-center")>
    <div className=%twc("max-w-5xl w-full lg:w-3/4 text-gray-900")>
      <Navigation /> <main className=%twc("mt-4 mx-4")> children </main>
    </div>
  </div>
}

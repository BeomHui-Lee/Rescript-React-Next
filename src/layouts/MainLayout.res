module Link = Next.Link

module Navigation = {
  @react.component
  let make = () =>
    <nav className="p-2 h-12 flex border-b border-gray-200 justify-between items-center text-sm">
      <Link href="/">
        <a className="flex items-center w-2/3">
          <span className="text-xl ml-2 align-middle font-semibold">
            {React.string("Next")}
            <span className="text-orange-500"> {React.string(" + ReScript")} </span>
            <span className="text-blue-400"> {React.string(" + React")} </span>
            <span className="text-purple-400"> {React.string(" + TailwindCss")} </span>
            <span className="text-green-400"> {`> 브이하우스`->React.string} </span>
          </span>
        </a>
      </Link>
      <div className="flex w-1/3 justify-end">
        <Link href="/"> <a className="px-3"> {`메인`->React.string} </a> </Link>
        <Link href="/examples"> <a className="px-3"> {`예제페이지`->React.string} </a> </Link>
        <Link href="/aoc2020"> <a className="px-3"> {`AOC문제`->React.string} </a> </Link>
      </div>
    </nav>
}

@react.component
let make = (~children) => {
  let minWidth = ReactDOM.Style.make(~minWidth="20rem", ())
  <div style=minWidth className="flex lg:justify-center">
    <div className="max-w-5xl w-full lg:w-3/4 text-gray-900 font-base">
      <Navigation /> <main className="mt-4 mx-4"> children </main>
    </div>
  </div>
}

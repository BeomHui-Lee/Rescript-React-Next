module P = {
  @react.component
  let make = (~children) => <p className="mb-2"> children </p>
}

let default = () =>
  <div>
    <h1 className="text-3xl font-semibold"> {`홈 화면`->React.string} </h1>
    <P>
      {React.string(` This is a simple template for a Next
      project using ReScript & TailwindCSS.`)}
    </P>
  </div>

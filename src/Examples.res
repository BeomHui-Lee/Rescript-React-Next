type props = {msg: string}

let default = (props: props) => <div> {React.string(props.msg)} </div>

let getServerSideProps = _ctx => {
  let props = {
    msg: `코드 작성`,
  }
  Js.Promise.resolve({"props": props})
}

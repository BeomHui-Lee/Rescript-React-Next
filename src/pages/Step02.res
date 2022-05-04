type init = {
  name: string,
  phone: string,
  agreePrivacy: bool,
}

let default = () => {
  let (name, setName) = React.useState(_ => "")

  //   React.useEffect(() => {
  //   setName(_ =>
  //     Dom.Storage2.sessionStorage
  //     ->Dom.Storage2.getItem("name")
  //     ->Belt.Option.mapWithDefault("", x => x)
  //   )
  //
  //   })

  <>
    <div id="header" className=%twc("h-14 absolute flex items-center z-10 w-full justify-center")>
      <h1 className=%twc("text-left text-xl font-bold leading-7")>
        {(Dom.Storage2.sessionStorage
        ->Dom.Storage2.getItem("name")
        ->Belt.Option.mapWithDefault("", x => x) ++ `님 `)->React.string}
      </h1>
    </div>
    <div className=%twc("h-screen pt-14 relative")>
      <div className="px-5 mt-3 pb-16">
        <div>
          <div className=%twc("text-center") />
          <div className=%twc("flex items-center")>
            <div className=%twc("flex-1")>
              <h2 className=%twc("font-bold text-base leading-6 mt-4")>
                {`단동 1중 비닐하우스`->React.string}
              </h2>
              <p className=%twc("mt-1")>
                {`단동 1중 구조에 비닐을 설치하고 측면을 개폐하는 온실 입니다.`->React.string}
              </p>
            </div>
            <div className=%twc("w-16 h-12 ml-2") />
          </div>
        </div>
        <div className=%twc("flex items-center mt-12")>
          <div className=%twc("flex-1")>
            <h2 className=%twc("font-bold text-base leading-6 mt-4")>
              {`단동 2중 비닐하우스`->React.string}
            </h2>
            <p className=%twc("mt-1")>
              {`단동 2중 구조에 비닐을 설치하고 측면을 개폐하는 온실 입니다.`->React.string}
            </p>
          </div>
          <div className=%twc("w-16 h-12 ml-2") />
        </div>
        <div className=%twc("flex items-center mt-12")>
          <div className=%twc("flex-1")>
            <h2 className=%twc("font-bold text-base leading-6 mt-4")>
              {`단동 3중 비닐하우스`->React.string}
            </h2>
            <p className=%twc("mt-1")>
              {`단동 3중 구조에 비닐과 보온용 커튼을 설치하고 측면을 개폐하는 온실 입니다.`->React.string}
            </p>
          </div>
          <div className=%twc("w-16 h-12 ml-2") />
        </div>
        <div>
          <div className=%twc("mt-12 text-center") />
          <div className=%twc("flex items-center")>
            <div className=%twc("flex-1")>
              <h2 className=%twc("font-bold text-base leading-6 mt-4")>
                {`연동 비닐하우스 폭7m x 측고3.5m`->React.string}
              </h2>
              <p className=%twc("mt-1")>
                {`60x60 각기둥 연동 구조에 비닐을 설치하고 측면을 개폐하는 온실 입니다.`->React.string}
              </p>
            </div>
            <div className=%twc("w-16 h-12 ml-2") />
          </div>
        </div>
        <div>
          <div className=%twc("mt-12 text-center") />
          <div className=%twc("flex items-center")>
            <div className=%twc("flex-1")>
              <h2 className=%twc("font-bold text-base leading-6 mt-4")>
                {`연동 비닐하우스 폭8m x 측고5m`->React.string}
              </h2>
              <p className=%twc("mt-1")>
                {`75x75 각기둥 연동 구조에 측면과 지붕을 개폐하는 온실 입니다.`->React.string}
              </p>
            </div>
            <div className=%twc("w-16 h-12 ml-2") />
          </div>
        </div>
        <div>
          <div className=%twc("mt-12 text-center") />
          <div className=%twc("flex items-center")>
            <div className=%twc("flex-1")>
              <h2 className=%twc("font-bold text-base leading-6 mt-4")>
                {`유리온실 폭8m x 측고5m`->React.string}
              </h2>
              <p className=%twc("mt-1")>
                {`150x75 각기둥 벤로 구조에 피복재로 유리(경질판)를 설치한 온실입니다.`->React.string}
              </p>
            </div>
            <div className=%twc("w-16 h-12 ml-2") />
          </div>
        </div>
      </div>
    </div>
  </>
}

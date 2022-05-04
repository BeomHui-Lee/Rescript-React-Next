module Link = Next.Link
module Router = Next.Router

type init = {
  name: string,
  phone: string,
  agreePrivacy: bool,
}

let default = () => {
  let router = Router.useRouter()
  let (name, setName) = React.useState(_ => "")
  let (phone, setPhone) = React.useState(_ => "")
  let (agreePrivacy, setAgreePrivcy) = React.useState(_ => false)
  let (validPhone, setValidPhone) = React.useState(_ => false)
  let (showPrivacyAgree, setShowPrivacyAgree) = React.useState(_ => false)

  let handleNameChange = e => {
    let value = (e->ReactEvent.Synthetic.currentTarget)["value"]

    setName(value)
  }

  let handlePhoneChange = e => {
    let value = (e->ReactEvent.Synthetic.currentTarget)["value"]

    let reValue = value->Js.String2.replaceByRe(%re("/[\D\s^-]+/g"), "")

    let spValue = reValue->Js.String2.match_(%re("/^(\d{0,3})(\d{0,4})(\d{0,4})/"))

    let finValue =
      spValue
      ->Belt.Option.map(arr =>
        arr
        ->Belt.Array.sliceToEnd(1)
        ->Belt.Array.reduce("", (acc, num) => `${acc}-${num}`)
        ->Js.String2.replaceByRe(%re("/^[-]+/g"), "")
        ->Js.String2.replaceByRe(%re("/[-]+$/g"), "")
      )
      ->Belt.Option.getWithDefault(phone)

    setValidPhone(_ =>
      finValue->Js.String2.slice(~from=0, ~to_=2) === "01" && finValue->Js.String2.length === 13
    )
    setPhone(_ => finValue)
  }

  let handlePrivacyCheckChange = e => {
    let value = (e->ReactEvent.Synthetic.currentTarget)["checked"]

    setAgreePrivcy(_ => value)
  }

  let openPrivacyAgree = _ => {
    setShowPrivacyAgree(_ => true)
  }

  let checkButtonDisabled = (name, phone, validPhone, agreePrivacy) => {
    let name_b = name->Js.String2.length > 1
    let phone_b = phone !== ""

    !(name_b && validPhone && phone_b && agreePrivacy)
  }

  let handleNextClick = _ => {
    Dom.Storage2.sessionStorage->Dom.Storage2.setItem("name", name)
    router->Router.push(`/step02`)
  }

  <>
    <div id="width-limit" className=%twc("max-w-2xl m-auto flex-col relative")>
      <div id="header" className=%twc("h-14 absolute left-0 z-10")>
        <div className=%twc("cursor-pointer w-14 h-14 float-left text-center p-3 hidden")>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor">
            <path
              strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 19l-7-7 7-7"
            />
          </svg>
        </div>
      </div>
      <div id="content" className=%twc("h-screen pt-14 relative")>
        <div className=%twc("relative")>
          <div className=%twc("mx-5")>
            <h1 className=%twc("font-bold text-2xl leading-8 pt-14")>
              {`정확한 시공 견적을 위해`->React.string}
              <br />
              <span className=%twc("text-gl-primary")> {`이름`->React.string} </span>
              {`과`->React.string}
              <span className=%twc("text-gl-primary")> {` 휴대전화번호`->React.string} </span>
              {`를`->React.string}
              <br />
              {`알려주세요`->React.string}
            </h1>
            <form className=%twc("mt-12")>
              <div className=%twc("flex flex-col justify-around")>
                <label
                  className=%twc(
                    "flex items-center cursor-pointer border border-solid border-gray-300 rounded-lg"
                  )>
                  <input
                    type_="text"
                    className=%twc("h-12 w-full px-4 focus:outline-none rounded-lg text-lg")
                    placeholder=`이름을 입력해주세요`
                    value={name}
                    onChange={handleNameChange}
                  />
                  {switch name !== "" {
                  | true => <span className=%twc("mr-3") onClick={_ => setName(_ => "")} />
                  | false => React.null
                  }}
                </label>
                <div>
                  <label
                    className=%twc(
                      "flex items-center cursor-pointer border border-solid border-gray-300 rounded-lg mt-3"
                    )>
                    <input
                      type_="text"
                      lang="ko-KR"
                      inputMode="numeric"
                      pattern="[0-9]*"
                      className=%twc("h-12 w-full px-4 focus:outline-none rounded-lg text-lg")
                      placeholder=`휴대전화번호를 입력해주세요`
                      value={phone}
                      onChange={handlePhoneChange}
                    />
                    <span className=%twc("mr-3") onClick={_ => setPhone(_ => "")} />
                  </label>
                </div>
                <div className=%twc("mt-7 ")>
                  <label className=%twc("text-base flex items-start")>
                    <input
                      type_="checkbox"
                      className=%twc(
                        "mr-2 w-5 h-5 cursor-pointer border rounded-md text-green-500 border-gray-400"
                      )
                      onChange={handlePrivacyCheckChange}
                      checked={agreePrivacy}
                    />
                    <div className=%twc("inline -mt-1 text-lg leading-5")>
                      {`(필수)개인정보 수집·이용제공·마케팅 활용에 동의합니다. `->React.string}
                    </div>
                    <div className=%twc("flex ml-3 self-center")>
                      <button onClick={openPrivacyAgree}>
                        <svg
                          width="16"
                          height="16"
                          viewBox="0 0 16 16"
                          fill="none"
                          xmlns="http://www.w3.org/2000/svg">
                          <path
                            fillRule="evenodd"
                            clipRule="evenodd"
                            d="M5.25277 14.2472C4.91574 13.9102 4.91574 13.3638 5.25277 13.0267L10.2795 8L5.25277 2.97327C4.91574 2.63624 4.91574 2.0898 5.25277 1.75277C5.5898 1.41574 6.13624 1.41574 6.47327 1.75277L12.1102 7.38975C12.4473 7.72678 12.4473 8.27322 12.1102 8.61025L6.47327 14.2472C6.13624 14.5843 5.5898 14.5843 5.25277 14.2472Z"
                            fill="#757575"
                          />
                        </svg>
                      </button>
                    </div>
                  </label>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div id="next-inner" className=%twc("fixed text-center bottom-0 w-full")>
        <div className=%twc("min-w-max max-w-2xl p-5")>
          <button
            className=%twc(
              "w-full bg-gl-primary text-white border border-solid border-transparent rounded-xl "
            )
            disabled={checkButtonDisabled(name, phone, validPhone, agreePrivacy)}
            onClick={handleNextClick}>
            <div className=%twc("w-full disabled:bg-gray-300 text-lg leading-10 font-bold")>
              {`다음`->React.string}
            </div>
          </button>
        </div>
      </div>
    </div>
  </>
}

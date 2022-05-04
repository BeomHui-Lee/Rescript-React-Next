type customError = {
  status: int,
  message: string,
}

type bindMutate = (~data: Js.Json.t=?, ~shouldRevalidate: bool=?, unit) => Js.Promise.t<bool>

//fetcherOptions revalidate-* does not work
type fetcherOptions
@obj
external fetcherOptions: (
  ~use: array<'a>=?,
  ~revalidateIfStale: bool=?,
  ~revalidateOnFocus: bool=?,
  ~revalidateOnReconnect: bool=?,
  ~revalidateOnMount: bool=?,
  unit,
) => fetcherOptions = ""

type fetcher = {
  data: option<Js.Json.t>,
  error: option<customError>,
  isValidating: bool,
  mutate: bindMutate,
}

type config = {mutate: (~url: string, ~data: Js.Json.t=?, ~shouldRevalidate: bool=?, unit) => unit}

type swrNext = (. string, fetcher, config) => fetcher

@module("swr")
external useSWR: ('key, 'fetcher, 'options) => fetcher = "default"

@module("swr")
external useSWRConfig: unit => config = "useSWRConfig"

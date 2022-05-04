import Step02Res from "../src/pages/Step02.mjs";

// Note:
// We need to wrap the make call with
// a Fast-Refresh conform function name,
// (in this case, uppercased first letter)
//
// If you don't do this, your Fast-Refresh will
// not work!
export default function Step02(props) {
    return <Step02Res {...props} />;
}

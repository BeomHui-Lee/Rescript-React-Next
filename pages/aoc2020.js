// import Day3Que from "../src/pages/aoc2020/Day3Q.mjs";
import Aoc2020 from "../src/pages/aoc2020/Aoc2020.js";

// Note:
// We need to wrap the make call with
// a Fast-Refresh conform function name,
// (in this case, uppercased first letter)
//
// If you don't do this, your Fast-Refresh will
// not work!
export default function Aoc(props) {
    return <Aoc2020 {...props}/>;
}

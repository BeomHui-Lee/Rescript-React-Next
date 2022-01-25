import Day1Que from "../src/pages/aoc2020/Day1Q.mjs"; // 리스크립트
// import Day1Que from "../src/pages/aoc2020/Day1Q.js"; // 자바스크립트

// Note:
// We need to wrap the make call with
// a Fast-Refresh conform function name,
// (in this case, uppercased first letter)
//
// If you don't do this, your Fast-Refresh will
// not work!
export default function Day1(props) {
    return <Day1Que {...props}/>;
}

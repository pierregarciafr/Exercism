// value : array of 2 strings
const COLORS = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'];
const colorCode = (color) => COLORS.indexOf(color);
export const decodedValue = (value) => {
  return (colorCode(value[0]) * 10 + colorCode(value[1]));
};

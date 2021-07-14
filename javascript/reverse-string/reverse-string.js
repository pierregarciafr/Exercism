export const reverseString = (string) => {
  if (string == '') { return ''; }
  if (string) {
    var arrayOfChars = string.split('');
    var newArray = [];
    for (var i = arrayOfChars.length - 1; i >= 0 ; i--) {
      newArray.push(arrayOfChars[i])
    }
    return newArray.join('');
  }
};

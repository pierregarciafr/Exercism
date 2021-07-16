const translate_date_into_milliseconds = (date) => {
  return Date.parse(date);
}

const travel_one_gigasecond = (date_in_milliseconds) => {
  const gigasecond = 10**9;
  return date_in_milliseconds + gigasecond * 1000;

}

const translate_milliseconds_into_date = (milliseconds) => {
  return new Date(milliseconds);
}

export const gigasecond = (date) => {
  var milliseconds =  translate_date_into_milliseconds(date);
  var translation = travel_one_gigasecond(milliseconds);
  var new_date = translate_milliseconds_into_date(translation);
  return new_date;
};

// const gs = gigasecond(new Date(Date.UTC(2011, 3, 25)));
// console.log(gs)
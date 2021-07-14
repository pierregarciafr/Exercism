export const steps = (x = 1) => {
  var n = 0;
  if (x < 1) { throw new Error('Only positive numbers are allowed'); }

  const step = (y) => { if (y%2 == 0) {
    return y / 2;
  } else { return (3 * y + 1) }
  }

  while (x != 1) {
  x = step(x);
  n += 1;
  }
  return n;
};

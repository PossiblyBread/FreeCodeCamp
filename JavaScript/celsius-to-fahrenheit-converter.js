function convertCtoF (celsius) {
  let fahrenheit = celsius * (9/5) + 32
  return fahrenheit;
}

let celsius = 0;
console.log(convertCtoF(celsius))

celsius = -30;
console.log(convertCtoF(celsius))

celsius = -10;
console.log(convertCtoF(celsius))

celsius = 20;
console.log(convertCtoF(celsius))

celsius = 30;
console.log(convertCtoF(celsius))


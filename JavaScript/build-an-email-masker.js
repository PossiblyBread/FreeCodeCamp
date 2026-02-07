function maskEmail(email) {
  let getCensorPart = email.slice(1, email.indexOf("@") -1)
  let numberOfRepeatAsterisk =  email.indexOf("@") -2;
  let replaceEmail = (getCensorPart.replace(getCensorPart, "*".repeat(numberOfRepeatAsterisk)))
  email = email.replace(getCensorPart, replaceEmail)
  return email;
}

let email = "psblybread@gmail.com";
console.log(maskEmail(email));

email = "apple.pie@example.com";
console.log(maskEmail(email))

email = "freecodecamp@example.com";
console.log(maskEmail(email))

email = "info@test.dev";
console.log(maskEmail(email))

email = "user@domain.org";
console.log(maskEmail(email))





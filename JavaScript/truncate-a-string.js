function truncateString(sentence, number){
  if (sentence.length <= number){
    return sentence
  }
  else {
    return sentence.slice(0, number) + "..."
  }
}

let sentence = "A-tisket a-tasket A green and yellow basket"
console.log(truncateString(sentence, 8))

sentence = "Peter Piper picked a peck of pickled peppers"
console.log(truncateString(sentence, 11))

sentence = "A-tisket a-tasket A green and yellow basket"
console.log(truncateString(sentence, "A-tisket a-tasket A green and yellow basket".length))

sentence = "A-tisket a-tasket A green and yellow basket"
console.log(truncateString(sentence, "A-tisket a-tasket A green and yellow basket".length + 2))

sentence = "A-"
console.log(truncateString(sentence, 1))

sentence = "Absolutely Longer"
console.log(truncateString(sentence, 2))
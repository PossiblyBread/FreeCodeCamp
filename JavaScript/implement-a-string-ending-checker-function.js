function confirmEnding(string, stringEnd){
  let stringEndCount = stringEnd.length
  let stringSlice = string.slice(-stringEndCount) 
  if (stringEnd == stringSlice){
    return true 
  }
  else {
    return false 
  }
}

console.log(confirmEnding("Congratulation", "on"))


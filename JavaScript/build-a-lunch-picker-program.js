const lunches = [];

function addLunchToEnd(lunches, foodName) {
  lunches.push(foodName);
  console.log(`${foodName} added to the end of the lunch menu.`);
  return lunches;
}

addLunchToEnd(lunches, "Tacos");
console.log(addLunchToEnd(["Pizza", "Tacos"], "Burger"));

function addLunchToStart(lunches, foodName) {
  lunches.unshift(foodName);
  console.log(`${foodName} added to the start of the lunch menu.`);
  return lunches;
}

addLunchToEnd(lunches, "Sushi");
console.log(addLunchToStart(["Burger", "Sushi"], "Pizza"));

function removeLastLunch(lunches) {
  if (lunches == "") {
    console.log("No lunches to remove.")
    return lunches
  }
  else {
    const removedFood = lunches.pop() 
    console.log(`${removedFood} removed from the end of the lunch menu.`)
    return lunches 
  }
}
console.log(removeLastLunch(["Sushi", "Pizza", "Noodles"])) 


function removeFirstLunch(lunches) {
  if (lunches == "") {
    console.log("No lunches to remove.")
    return lunches
  }
  else {
    const removedFood = lunches.shift() 
    console.log(`${removedFood} removed from the start of the lunch menu.`)
    return lunches 
  }
}

function getRandomLunch(lunches){
  if(lunches == ""){
    console.log("No lunches available.")
    return lunches
  }
  else {
    const lunchesRandom = Math.floor(Math.random() * lunches.length)
    const randomNumber = lunches[lunchesRandom]
    console.log(`Randomly selected lunch: ${randomNumber}`)
    return randomNumber
  }
}
console.log(getRandomLunch(lunches))

function showLunchMenu(lunches){
  if(lunches == ""){
    console.log("The menu is empty.")
    return lunches
  }
  else {
    
    console.log(`Menu items: ${lunches.join(", ")}`)
    return lunches
  }
}
console.log(showLunchMenu(["Greens", "Corns", "Beans"]))
showLunchMenu(["Pizza", "Burger", "Fries", "Salad"])

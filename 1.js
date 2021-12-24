sum = 0
number = 1
function add() {
    if (document.getElementById("inputName").value == "" || document.getElementById("inputCost").value == "")
        return;
    
    let bask = document.getElementById("basket");
    let new_tr = document.createElement("tr");
    let new_th = document.createElement("th");
    let new_td_name = document.createElement("td");
    let new_td_cost = document.createElement("td");
    new_th.innerHTML = number;
    ++number;
    new_td_name.innerHTML = document.getElementById("inputName").value;
    new_td_cost.innerHTML = document.getElementById("inputCost").value;
    sum += parseInt(document.getElementById("inputCost").value, 10);
    new_tr.appendChild(new_th);
    new_tr.appendChild(new_td_name);
    new_tr.appendChild(new_td_cost);
    new_td_cost.id = "td_cost";
    bask.appendChild(new_tr);
    console.log(document.getElementById('inputName').value)
    document.getElementById('inputName').value = "";
    document.getElementById('inputCost').value = "";
}

function cost() {
    let cost_output = document.getElementById("cost_output");
    cost_output.value = sum;
}
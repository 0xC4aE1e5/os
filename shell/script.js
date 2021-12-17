if (navigator.userAgent.includes("Windows")) {
    document.querySelector(".files").setAttribute("onclick", "window.open('file:///C:/Users/', '', 'width=800,height=600')")
}

function startTime() {
    const today = new Date();
    let h = today.getHours();
    let m = today.getMinutes();
    m = checkTime(m);
    document.getElementById('clock').innerHTML =  h + ":" + m;
    setTimeout(startTime, 1000);
}
  
function checkTime(i) {
    if (i < 10) {i = "0" + i};
    return i;
}
startTime();

function appmaker() {
    document.getElementById("appm").style.display = "block";
};

function appgen() {
    var name = document.getElementById("title").value
    var url = document.getElementById("url").value;
    if (!localStorage.getItem("apps")) {
        localStorage.setItem("apps", `<button class="btn-small waves-effect white black-text app" title="${name}" onclick="window.open('${url}', '', 'width=800,height=600')">${name}</button>`);
    } else {
        localStorage.setItem("apps", localStorage.getItem("apps") + `\n<button class="btn-small waves-effect white black-text app" title="${name}" onclick="window.open('${url}', '', 'width=800,height=600')">${name}</button>`);
    }
    window.reload();
}

if (localStorage.getItem("apps") != null) {
    document.getElementById("apps").innerHTML += localStorage.getItem("apps");
}
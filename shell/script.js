function web() {
    open("https://lite.duckduckgo.com/lite", "", "width=800,height=600")
}

function dropbox() {
    open("https://dropbox.com", "", "width=800,height=600")
}

function build() {
    document.getElementById("appMUI").style.display = "block";
}

function generate() {
    if (localStorage.getItem("apps") == null) {
        var apps = {};
        apps[document.getElementById("appName").value] = document.getElementById("appLink").value;
        localStorage.setItem("apps", JSON.stringify(apps));
    }
    else {
        var apps = JSON.parse(localStorage.getItem("apps"));
        apps[document.getElementById("appName").value] = document.getElementById("appLink").value;      
        localStorage.setItem("apps", JSON.stringify(apps));
    }
    var apps = JSON.parse(localStorage.getItem("apps"));
    apps[document.getElementById("appName").value] = document.getElementById("appLink").value;
    location.reload();
}

for (const element of Object.keys(JSON.parse(localStorage.getItem("apps")))) {
    apps = JSON.parse(localStorage.getItem("apps"));
    document.querySelector("tr").innerHTML += `<td onclick="window.open('${apps[element]}', '', 'width=800,height=600')"><img src="icons/jigsaw.png"><center>${element}</center></td>`
}
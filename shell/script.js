function viewApps() {
    if (!document.getElementById("apps").style.display != "none") {
        document.getElementById("apps").style.display = "block";
        document.getElementById("wallpaper").style.display = "none";
    } else {
        document.getElementById("apps").style.display = "none";
        document.getElementById("wallpaper").style.display = "block";
    }
}

function web() {
    window.open("https://lite.duckduckgo.com/lite", "", "width=800,height=600")
}

function dropbox() {
    window.open("https://dropbox.com", "", "width=800,height=600")
}

var serverIP = "192.168.100.20"; 
var wsURI = "ws://" + serverIP + ":8080/KidTales/chat";

var websocket = new WebSocket(wsURI);
console.log("WebSocket readyState: " + websocket.readyState);

websocket.onmessage = function(evnt) {
    onMessage(evnt);
};

websocket.onopen = function()  {
    onOpen();
};
function onOpen() {
    console.log("Opened connection: " + wsURI);
}

function onClose() {
    console.log("Closed connection: " + wsURI);
}

websocket.onerror = function(event) {
     
    console.error("WebSocket error:", event.message);
};

function onMessage(event) {
    console.log(event);
    display(event.data);
}

function display(dataString) {
    var data = JSON.parse(dataString);
    var contentMessage = "<p>Usuario " + data.userName + " envia: " + data.conten + "</p>";
    document.getElementById("output").innerHTML += contentMessage + "</br>";
}

function send() {
    if (websocket.readyState === WebSocket.OPEN) {
        var message = document.getElementById("message_input").value;
        var username = document.getElementById("username_input").value;
        var json = {
            "conten": message,
            "userName": username
        };
        console.log("Sending " + message);
        websocket.send(JSON.stringify(json));
    } else {
        console.error("WebSocket connection is not open.");
    }
}

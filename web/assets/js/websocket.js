
var serverIP = "40.86.11.134"; 
var wsURI = "ws://" + serverIP + ":8080/KidTales/chat";

var websocket = new WebSocket(wsURI);
console.log("WebSocket readyState: " + websocket.readyState);

websocket.onmessage = function (evnt) {
    onMessage(evnt);
};

websocket.onopen = function () {
    onOpen();
};
function onOpen() {
    console.log("Opened connection: " + wsURI);
}

function onClose() {
    console.log("Closed connection: " + wsURI);
}

websocket.onerror = function (event) {

    console.error("WebSocket error:", event.message);
};

function onMessage(event) {
    console.log(event);
    display(event.data);
}

function display(dataString) {
    var data = JSON.parse(dataString);
    var contentMessage = data.conten + "</p>";
    document.getElementById("output").innerHTML += contentMessage + "</br>";
}


function send() {
  

    if (websocket.readyState === WebSocket.OPEN) {
        var message = document.getElementById("message_input").value;
        var encryptedMessage = encryptMessage(message);

        var json = {
            "conten": encryptedMessage,
        };
        console.log("Sending " + encryptedMessage);
        websocket.send(JSON.stringify(json));
    } else {
        console.error("WebSocket connection is not open.");
    }
}

var mapaDeSustitucionCifrado = {
    'a': 'O2',
    'A': '2T',
    'b': 'G1',
    'B': '2G',
    'c': 'J1',
    'd': 'I1',
    'e': 'C1',
    'f': 'A1',
    'g': 'S1',
    'h': 'Z1',
    'i': 'N1',
    'j': 'F1',
    'k': 'T1',
    'l': 'E0',
    'm': 'W0',
    'n': 'M0',
    'ñ': 'V0',
    'o': 'X0',
    'p': 'H0',
    'q': 'D0',
    'r': 'P0',
    's': 'L0',
    't': 'K2',
    'u': 'R2',
    'v': 'Y2',
    'w': 'U2',
    'x': 'Q2',
    'y': 'B2',
    'z': 'J2',
    'C': '2S',
    'D': '2Y',
    'E': '2B',
    'F': '2R',
    'G': '2I',
    'H': '2Q',
    'I': '1q',
    'J': '1X',
    'K': '1Z',
    'L': '1G',
    'M': '1O',
    'N': '1Y',
    'Ñ': '1S',
    'O': '1J',
    'P': '1I',
    'Q': '1Q',
    'R': '0q',
    'S': '0W',
    'T': '0P',
    'U': '0G',
    'V': '0S',
    'W': '0E',
    'X': '0B',
    'Y': '0C',
    'Z': '0I',
    '1': 'Sz',
    '2': 'Ay',
    '3': 'Fx',
    '4': 'Ew',
    '5': 'iF',
    '6': 'Te',
    '7': 'Od',
    '8': 'Lc',
    '9': 'Ub',
    '0': 'Da',
    ' ': '00',
    ':': '01',
    '!': '02',
    '$': '03',
    '#': '04',
    '*': '05',
    '%': '06',
    '&': '07',
    '/': '08',
    '(': '09',
    ')': '10',
    '=': '11',
    '¿': '12',
    '¡': '13',
    '?': '14',
    ';': '15',
    '<': '16',
    '>': '17',
    '-': '18',
    '_': '19',
    '+': '20',
    '~': '21',
    '^': '22',
    'á': 'aA',
    'é': 'eE',
    'í': 'iI',
    'ó': 'oO',
    'ú': 'uU',
    'Á': 'Aa',
    'É': 'Ee',
    'Í': 'Ii',
    'Ó': 'Oo',
    'Ú': 'Uu',
    'ä': 'aa',
    'ë': 'ee',
    'ï': 'ii',
    'ö': 'oo',
    'ü': 'uu',
    'Ä': 'AA',
    'Ë': 'EE',
    'Ï': 'II',
    'Ö': 'OO',
    'Ü': 'UU',
    '\'': '24',
    '{': '25',
    '}': '26',
    '[': '27',
    ']': '28',
    '"': '29',
    '\\': '30',
    '.': '31',
    ',': '32'
};

function encryptMessage(message) {
    var encryptedMessage = "";

    for (var i = 0; i < message.length; i++) {
        var char = message[i];
        var substitution = mapaDeSustitucionCifrado[char];

        encryptedMessage += substitution || char;
    }

    return encryptedMessage;
}


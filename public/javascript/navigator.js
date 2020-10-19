
var clicks = 0;

//Call this function on the initial document load to start the navigator
function initiateNavigator() {
    $(document).ready(function(){
        $.post("/navigator/navigate",
            {
                url: "/"
            },
            function(data) {
                $("#test").html(data);
            });
    });
}

//call this function on button press to traverse the directory
function sendRequest(url) {
        if(url != '/')
            url += "/";
        $.post("/navigator/navigate",
            {
                url: url
            },
            function(data) {
                $("#test").html(data);
            });
}

//Select folder
function selectFolder(url) {
    return url;
}
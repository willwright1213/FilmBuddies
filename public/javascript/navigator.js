
var clicks = 0;

//Call this function on the initial document load to start the navigator
function initiateNavigator(type) {
    $(document).ready(function(){
        $.post("/navigator/navigate",
            {
                url: 'initiate',
                type: type
            },
            function(data) {
                $("#folder-wrapper").html(data);
                $('#loader-wrapper').hide();
            });
    });
}

//call this function on button press to traverse the directory
function sendRequest(url, type) {
        if(url != '/')
            url += "/";
        $.post("/navigator/navigate",
            {
                url: url,
                type: type
            },
            function(data) {
                $("#folder-wrapper").html(data);
            });
}

//Select folder.png
function selectFolder(url, container_id) {
    $(container_id).val(url);
}

function host(url) {
    $('#folder-wrapper').load('/loader.html');
    $.post("/video/hoster",
        {
            url: url
        });
}
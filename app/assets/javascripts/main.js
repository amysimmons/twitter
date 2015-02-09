



// $('.message').on('input', function()

function updateCountdown() {
    // 140 is the max message length

    var remaining = 140 - $('.new-tweet-content').val().length;

    $('.new-tweet-counter').text(remaining + ' characters remaining');

    if (remaining == 0 ) {
        $( ".new-tweet-content" ).effect( "shake" );
    }

}





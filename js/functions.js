// Parallax //
let scene = document.getElementById('scene');
let parallax = new Parallax(scene);

let loadedCount = 0;

function showData(filename, containerName, reverseScroll) {
    let directory = '/'+filename;

    $(containerName).fadeOut('fast', function(){
        $(this).remove();
    });

    $.get(directory, function(data){ 
        if(!reverseScroll){
            // $('.section-container')
            // .animate({ scrollTop: $(containerName).offset() }, 1000);
            $(data).slideUp('normal', function() {
                $(data).appendTo('.section-container');
            });
        } else {
            $(data).slideDown('normal', function() {
                $(data).appendTo('.section-container');
            });
        }
        // $("#loadingAnimation1").hide();
    });
}

// Page switch //
$('window, body, object').on( 'mousewheel', function () {
    $('window, body, object').one( 'mousewheel', function ( event ) {
        if( event.originalEvent.detail > 0 || 
            event.originalEvent.wheelDelta < 0) { 
            //alternative options for wheelData: wheelDeltaX & wheelDeltaY
            //scroll down
            if(loadedCount == 0) {
                // $("#loadingAnimation1").show();
                showData("works.html", "#indexContainer", false);
                loadedCount++;
                return;
            } 
            if(loadedCount == 1) {
                showData("about-me.html", "#worksContainer", false);
                loadedCount++;
                return;
            }
            if(loadedCount == 2) {
                showData("contact-me.html", "#aboutContainer", false);
                loadedCount++;
                return;
            }
        } else {
            //scroll up
            if (loadedCount <= 0) {
                loadedCount = 0;
                return;
            }
            if(loadedCount == 1) {
                showData("index-load.html", "#worksContainer", true);
                loadedCount--;
                return;
            }
            if(loadedCount == 2) {
                showData("works.html", "#aboutContainer", true);
                loadedCount--;
                return;
            }
            if(loadedCount == 3) {
                showData("about-me.html", "#contactContainer", true);
                loadedCount--;
                return;
            }
        }
    });
});

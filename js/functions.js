// Parallax //
let scene = document.getElementById('scene');
let parallax = new Parallax(scene);
// Parallax //

// Page switch //
let loadedCount = 0;
let loadedPages = ['#indexContainer'];
let firstLoad = true;

function loadPage(directory, containerName, reverseScroll) {
    $.get(directory, function(data){ 
        if(!reverseScroll){
            $(data).slideUp('normal', function() {
                $(data).appendTo('.section-container');
            });
        } else {
            $(data).slideDown('normal', function() {
                $(data).appendTo('.section-container');
            });
        }

        if(!loadedPages.includes(containerName)) {
            loadedPages.push(containerName);
            console.log('Loaded page ' + loadedPages[(loadedPages.indexOf(containerName))+1]);
        }
        // $("#loadingAnimation1").hide();
    });
    return;
}

function scrollToPage(containerName, reverseScroll) {
    var pageVal = 0;
    reverseScroll?pageVal=-1:pageVal=0;
    $(containerName)
    .fadeOut('fast', function(){
        $(this).hide(); //hide old container
    });
    console.log("Coming from " + loadedPages[(loadedPages.indexOf(containerName))]);
    $(loadedPages[(loadedPages.indexOf(containerName))]+pageVal)
    .fadeIn('fast', function(){ //show new container
        $(this).show();
    });
    return;
}

function showData(filename, containerName, reverseScroll) {
    let directory = '/'+filename;

    if (containerName == "#indexContainer" && firstLoad) {
        loadPage(directory, containerName, reverseScroll);
        scrollToPage(containerName, reverseScroll);
        firstLoad != firstLoad;
    } else if(loadedPages.includes(containerName) && reverseScroll) {
        scrollToPage(containerName, reverseScroll);
    } else if(loadedPages.includes(containerName) && containerName != "#indexContainer"
     && !reverseScroll) {
        scrollToPage(containerName, reverseScroll);
    } else {
        loadPage(directory, containerName, reverseScroll);
        scrollToPage(containerName, reverseScroll);
    }
    return;
}

$('window, body, object').on( 'mousewheel', function () {
    $('window, body, object').one( 'mousewheel', function ( event ) {
        if( event.originalEvent.detail > 0 || 
            event.originalEvent.wheelDelta < 0) { 
            //alternative options for wheelData: wheelDeltaX & wheelDeltaY
            //scroll down
            if(loadedCount == 0) {
                // $("#loadingAnimation1").show();
                showData("works.html", "#indexContainer", false);
                console.log('Loaded count ' + loadedCount);
                loadedCount++;
                return;
            } 
            if(loadedCount == 1) {
                showData("about-me.html", "#worksContainer", false);
                console.log('Loaded count ' + loadedCount);
                loadedCount++;
                return;
            }
            if(loadedCount == 2) {
                showData("contact-me.html", "#aboutContainer", false);
                console.log('Loaded count ' + loadedCount);
                loadedCount++;
                return;
            }
        } else {
            //scroll up
            if (loadedCount <= 0) {
                loadedCount = 0;
                console.log('Loaded count ' + loadedCount);
                return;
            }
            if(loadedCount == 1) {
                showData("index-load.html", "#worksContainer", true);
                console.log('Loaded count ' + loadedCount);
                loadedCount--;
                return;
            }
            if(loadedCount == 2) {
                showData("works.html", "#aboutContainer", true);
                console.log('Loaded count ' + loadedCount);
                loadedCount--;
                return;
            }
            if(loadedCount == 3) {
                showData("about-me.html", "#contactContainer", true);
                console.log('Loaded count ' + loadedCount);
                loadedCount--;
                return;
            }
        }
    });
});

// Parallax //
let scene = document.getElementById('scene');
let parallax = new Parallax(scene);
// Parallax //

// Swup //
// const swup = new Swup();
// Swup //

// Page switch //
let loadedCount = 0;
let loadedPages = ['#indexContainer'];

function scrollToPage(containerName, loadedCount, reverseScroll) {
    let pageVal = 0;
    reverseScroll?pageVal=-1:pageVal=1;
    let index = loadedCount+pageVal;

    $(containerName)
        .addClass("hidden")
        .fadeOut('fast', function(){
            $(this).hide(); //hide old container
    });

    $(loadedPages[index])
        .removeClass("hidden")
        .fadeIn('fast', function(){ //show new container
            $(this).show();
    });
    return;
}

function loadPage(directory, loadContainer, reverseScroll) {
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

        if(!loadedPages.includes(loadContainer)) {
            loadedPages.push(loadContainer);
        }
        // $("#loadingAnimation1").hide();
    });
    return;
}

function showData(filename, containerName, loadContainer, loadedCount, reverseScroll) {
    let directory = '/'+filename;
    let i = 0,  loaded=false;

    //Check if loaded
    if(loadedPages[loadedCount] == loadContainer && !reverseScroll){
        loaded = true;
    }
    if(loadedPages[loadedCount-1] == loadContainer && reverseScroll){
        loaded = true; 
    }

    console.log(loadedPages[loadedCount] + "on index " + loadedCount);
    console.log("Loaded: " + loaded);

    if(loaded && reverseScroll) {
        scrollToPage(containerName, loadedCount, reverseScroll);
    } else if(loaded && !reverseScroll) {
        scrollToPage(containerName, loadedCount, reverseScroll);
    } else {
        loadPage(directory, loadContainer, reverseScroll);
        scrollToPage(containerName, loadedCount, reverseScroll);
    }
    return;
}

$('window, body, object').on('mousewheel', function () {
    $('window, body, object').one('mousewheel', function (event) {
        if( event.originalEvent.detail > 0 || 
            event.originalEvent.wheelDelta < 0) { 
            //alternative options for wheelData: wheelDeltaX & wheelDeltaY
            //scroll down
            if(loadedCount == 0) {
                // $("#loadingAnimation1").show();
                showData("works.html", "#indexContainer", "#worksContainer", loadedCount+1, false);
                loadedCount++;
                return;
            } 
            if(loadedCount == 1) {
                showData("about-me.html", "#worksContainer", "#aboutContainer", loadedCount+1, false);
                loadedCount++;
                return;
            }
            if(loadedCount == 2) {
                showData("contact-me.html", "#aboutContainer", "#contactContainer",loadedCount+1, false);
                loadedCount++;
                return;
            }
            if(loadedCount >= 3) {
                loadedCount = 3;
                return;
            }
        } else {
            //scroll up
            if (loadedCount <= 0) {
                loadedCount = 0;
                return;
            }
            if (loadedCount == 1) {
                showData("", "#worksContainer", "#indexContainer", loadedCount, true);
                loadedCount--;
                return;
            }
            if(loadedCount == 2) {
                showData("works.html", "#aboutContainer", "#worksContainer", loadedCount, true);
                loadedCount--;
                return;
            }
            if(loadedCount == 3) {
                showData("about-me.html", "#contactContainer", "#aboutContainer", loadedCount, true);
                loadedCount--;
                return;
            }
        }
    });
});
// Page switch //

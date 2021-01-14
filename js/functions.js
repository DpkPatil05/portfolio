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
        }
        // $("#loadingAnimation1").hide();
    });
    return;
}

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

function showData(filename, containerName, loadedCount, reverseScroll) {
    let directory = '/'+filename;

    if(containerName == "#indexContainer" && firstLoad) {
        loadPage(directory, containerName, reverseScroll);
        scrollToPage(containerName, loadedCount, reverseScroll);
        firstLoad != firstLoad;
    } else if(loadedPages.includes(containerName) && reverseScroll) {
        scrollToPage(containerName, loadedCount, reverseScroll);
    } else if(loadedPages.includes(containerName) && containerName != "#indexContainer"
     && !reverseScroll) {
        scrollToPage(containerName, loadedCount, reverseScroll);
    } else {
        loadPage(directory, containerName, reverseScroll);
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
                showData("works.html", "#indexContainer", loadedCount, false);
                loadedCount++;
                return;
            } 
            if(loadedCount == 1) {
                showData("about-me.html", "#worksContainer", loadedCount, false);
                loadedCount++;
                return;
            }
            if(loadedCount == 2) {
                showData("contact-me.html", "#aboutContainer", loadedCount, false);
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
                showData("index-load.html", "#worksContainer", loadedCount, true);
                loadedCount--;
                return;
            }
            if(loadedCount == 2) {
                showData("works.html", "#aboutContainer", loadedCount, true);
                loadedCount--;
                return;
            }
            if(loadedCount == 3) {
                showData("about-me.html", "#contactContainer", loadedCount, true);
                loadedCount--;
                return;
            }
        }
    });
});

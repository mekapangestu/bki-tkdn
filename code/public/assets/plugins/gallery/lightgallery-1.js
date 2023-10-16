//  lightGallery(document.getElementByClass('lightgallery'));
Array.from(document.getElementsByClassName("lightgallery")).forEach(
    function (element, index, array) {
        lightGallery(element);
    }
);
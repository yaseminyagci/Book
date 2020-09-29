const topBtn= $("#myBtn");


const functions = {
    scrollFunction: () => {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            topBtn.css("display","block") ;
        } else {
            topBtn.css("display", "none") ;
        }},
    topButton: () => {
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () { functions.scrollFunction() };   
    },
    // When the user clicks on the button, scroll to the top of the document
    topFunction: () => {
        document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    }
};

jQuery(document).ready(function () {
    functions.topButton();
    $(topBtn).on("click", function (e) {
        functions.topFunction();
    });   
});

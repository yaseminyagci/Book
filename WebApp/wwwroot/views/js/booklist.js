const constants = {
    form: $("#form"),
    detailForm: $("#detailForm"),
    getUrl: '/api/Book/getall',
    nextBook: $("#oldBook"),
};

function getDate(date) {
    date = date.substring(0, 10);
    return date;
}
var btn = $("#oldBook");
var value = 0;
main = {

    buildEvents: () => {
        constants.nextBook.on("click",
            function (e) {
                main.getDataToView(value);
                value += 1;

            });

        if (value == "0") {
            main.getDataToView(value);
            value += 1;
        }



    },
    getDataToView: (id) => {

        request.Get('/api/Book/GetAllGuest/' + id,
            null,
            function (response) {
                console.log(response);
                for (var i = 0; i < response.data.length; i++) {
                    //var unEscapedResponse = unescape(response.data[i].content);
                    var unEscapedResponse = decodeURIComponent(response.data[i].content);

                    console.log("unEscaped", unEscapedResponse);
                    response.data[i].content = unEscapedResponse.substring(0, 25);
                    response.data[i].dateCreated = getDate(response.data[i].dateCreated);
                }

                for (var i = 0; i < response.data.length; i++) {

                    var hmtlString = '<div class="Book-preview"><h2 class="Book-title" id="title"><a href="/detail/' + response.data[i].id + '">' + response.data[i].title + '</a></h2><p> <a href="/detail/' + response.data[i].id + '"><em style="color:tomato;"> to be countinued</em></a></p><p class="Book-meta">Booked <a href="#">Start Bootstrap</a>' + response.data[i].dateCreated + '</p></div >';
                    $(form).find('div[id="Books"]').append(hmtlString);
                }

            });
    },
}

jQuery(document).ready(function () {
    main.buildEvents();
});
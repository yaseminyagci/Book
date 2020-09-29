
var logOut = $("#logout");
jQuery(document).ready(function () {
    $(logOut).on("click",
        function (e) {
            e.preventDefault();
            var url = URLS.ACCOUNT.LOGOUT;
            request.Post(url,
                null,
                function (response) {

                    var message = response.message;
                    swal.fire({
                        "title": "",
                        "text": message,
                        "type": response.isError ? "warning" : "success",
                        "confirmButtonClass": "btn btn-secondary"
                    });
                    if (!response.isError)
                        redirect(URLS.ACCOUNT.LOGIN);
                   
                });


        });
});

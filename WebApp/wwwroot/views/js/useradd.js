﻿const constants = {

    form: $("#form"),
    index: URLS.BOOK.INDEX,

};

const main = {
    buildEvents: () => {

        $(constants.form).on("submit",
            function (e) {
                e.preventDefault();
                var btn = $(this).find('button[type="submit"]');
                $(constants.form).serializeObject().then(result => {
                    var url = '/api/user/Add';
                    console.log("request",result)
                   // KTApp.progress(btn);
                    request.Post(url,
                        result,
                        function (response) {
                            var message = response.message;
                            swal.fire({
                                "title": "",
                                "text": message,
                                "type": response.isError ? "warning" : "success",
                                "confirmButtonClass": "btn btn-secondary"
                            });
                            
                            // $(constants.modal).modal("hide");
                            // functions.reloadTable();
                           // KTApp.unprogress(btn);
                        });

                });

            });
    },

    

init: () => {
    main.buildEvents();
}
};
jQuery(document).ready(function () {
    main.init();
});

let dataTable;
const constants = {
    comment: {
        user: "",
        date: "",
        comment: ""
    },
    comments: {},

};

const functions = {

    getDate: (date) => {
        date = date.substring(0, 10);
        return date;
    },

    addComment: (comment) => {
        $('#comments').append(`<li class="nav-item">
                               <p class="nav-link">
                                ${comment.user} :                             
                                ${comment.comment} 
                                </br>
                                ${comment.date}
                                </br>
                                 Book Name:
                                ${comment.Book}
                               </p>`)
    },

    setTagsSelectData: () => {
        constants.comments = selector.getAllComments();
        var arr = $.map(constants.comments,
            function (val, index) {
                return {
                    value: val.id, comment: val.content, createdDate: functions.getDate(val.dateCreated), user: val.userDetail.fullName
                ,book:val.book.title};
            });
        
        $.each(arr, function (name, value) {
            console.log(name + '=' + value);

            functions.addComment({ user: value.user, date: value.createdDate, comment: value.comment ,Book:value.book});

        });
    },

};

jQuery(document).ready(function () {
    functions.setTagsSelectData();
   
});

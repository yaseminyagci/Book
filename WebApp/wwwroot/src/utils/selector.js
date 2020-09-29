const selector = {
    getAllbyTags: (id) => {
        let data = null;
        request.Get(URLS.LIKES.GETALLBYTAGS,
            null,
            function (response) {
                if (!response.isError)
                    data = response.data;
            }, { async: false });
        return data;
    },
    getComments: (id) => {
        let data = null;
        request.Get("/api/comment/GetByBook/" + id,
            null,
            function (response) {
                if (!response.isError)
                    data = response.data;
            }, { async: false });
        return data;
    },
    getAllComments: () => {
        let data = null;
        request.Get("/api/comment/GetAllTop10/",
            null,
            function (response) {
                if (!response.isError)
                    data = response.data;
            }, { async: false });
        return data;
    },
    getTags: () => {
        let data = null;
        request.Get("/api/tags/getall",
            null,
            function (response) {             
                if (!response.isError)
                    data = response.data;
            }, { async: false });
        return data;
    },
    getSelectedTags: (id) => {
        let data = null;
        request.Get("/api/Book/GetTag/"+id,
            null,
            function (response) {
                if (!response.isError)
                    data = response.data;
            }, { async: false });
        return data;
    },
    getCategories: () => {
        let data = null;
        request.Get(URLS.CATEGORY.GET_ALL,
            null,
            function (response) {
                if (!response.isError)
                    data = response.data;
            }, {async:false});
        return data;
    }, 
    getRoles: () => {
        let data = null;
        request.Get(URLS.ROLE.GET_ALL,
            null,
            function (response) {
                if (!response.isError)
                    data = response.data;
            }, { async: false });
        return data;
    }, 
    getButtonSettings: () => {
        let data = null;
        request.Get(URLS.BUTTON_SETTINGS.GET_ALL,
            null,
            function (response) {
                if (!response.isError)
                    data = response.data;
            }, { async: false });
        return data;
    }
}
//const SERVER_URL = '';
//const LOCAL_URL = 'https://localhost:5001';

const protocol = location.protocol;
const host = protocol + "//" + location.host;
const URLS = {
    HOST: host,
    BOOK: {
        INDEX: '/Book',
        GET_ALL: '/api/Book/getall',

        GET: '/api/Book/get',
        ADD: '/api/Book/add',
        EDIT: '/api/Book/edit',
        DELETE: '/api/Book/delete',
        ADDPAGE: '/Bookadd',
        EDITPAGE: '/Bookedit/',
        DETAILPAGE: '/Bookdetail/',
        
    },
    USERS: {
        INDEX: '/index',
        GET_ALL: '/api/user/getall',

        GET: '/api/user/get',
        ADD: '/api/user/add',
        EDIT: '/api/user/edit',
        DELETE: '/api/user/delete',
        ADDPAGE: '/useradd',
        EDITPAGE: '/useredit/',
        DETAILPAGE: '/userdetail/',
    },
    TAGS: {
        INDEX: '/index',
        GET_ALL: '/api/tags/getall',

        GET: '/api/tags/get',
        ADD: '/api/tags/add',
        EDIT: '/api/tags/edit',
        DELETE: '/api/tags/delete',
    },
    LIKES: {
        GET_ALL: '/api/Likes/getall',

        GET: '/api/Likes/get',
        GETBYBOOK: '/api/Likes/getByBook/',
        ADD: '/api/Likes/add',
        EDIT: '/api/Likes/edit',
        DELETE: '/api/Likes/delete',
        GETALLBYTAGS:'/api/likes/GetAllbyTags'
    },
    COMMENT: {
        GET_ALL: '/api/Comment/getall',
     
        GET: '/api/Comment/get',
        ADD: '/api/Comment/add',
        EDIT: '/api/Comment/edit',
        DELETE: '/api/Comment/delete',
    },
    ACCOUNT: {
        LOGIN: 'Login',
        LOGOUT: '/api/account/logout',
    },
    HOME: {
        INDEX: 'Dashboard/',
        GUEST: 'Index/',
        LOGIN: 'login/'
    },
    ROLE: {
        INDEX: '/Roles',
        GET_ALL: '/api/role/getall',
        ADD: '/api/role/add',
        EDIT_ROUTE: '/EditRole',
        DELETE: '/api/role/delete',

    }
}


function redirect(URL) {
    location.href = "/" + URL;
}

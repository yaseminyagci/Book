using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Process.Repository;
using Shared.Resources.Book;
using Shared.Resources.TagBook;

namespace WebApp.Controllers.Route
{

    [Authorize]
    [Route("")]

    public class BookRouteController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Book> _repository;
        private readonly IRepository<TagBook> _repositoryTagBook;
        private readonly IMapper _mapper;
        public BookRouteController(IRepository<Book> repository, IMapper mapper, IUnitOfWork unitOfWork, IRepository<TagBook> repositoryTagBook)
        {
            _repositoryTagBook = repositoryTagBook;
            _repository = repository;
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }
        [HttpGet("BookList")]
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet("Book")]
        public IActionResult Book()
        {
            return View();
        }

        [HttpGet("BookEdit/{id}")]
        public async Task<IActionResult> BookEdit(int id)
        {
            var resultTag = _repositoryTagBook.GetAll().Where(x => x.BookId == id).ToList();

            var items = _mapper.Map<List<TagBook>, List<TagBookGetData>>(resultTag);
            ViewBag.Tags = items;

            var item = await _repository.GetSingleFirstAsync(c => c.Id == id).ConfigureAwait(false);
            var result = _mapper.Map<Book, BookGetData>(item);

            return View(result);
        }

        [HttpGet("BookAdd")]
        public IActionResult BookAdd()
        {
            return View();
        }
        
        [HttpGet("BookDetail")]
        public async Task<IActionResult> BookDetail(int id)
        {
            var resultTag = await _repository.GetSingleFirstAsync(x => x.Id == id).ConfigureAwait(false);

            var item = _mapper.Map<Book, BookGetData>(resultTag);

            return View(item);
        }
    }
}
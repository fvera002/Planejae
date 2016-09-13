using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Planejae.UI.Controllers
{
    public class ProjetoController : Controller
    {
        //
        // GET: /Projeto/
        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Projeto/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Projeto/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Projeto/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Projeto/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Projeto/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Projeto/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Projeto/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}

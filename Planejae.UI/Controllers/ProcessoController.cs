using Planejae.UI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;


namespace Planejae.UI.Controllers
{
    public class ProcessoController : Controller
    {
        public BLL.Classes.ProcessoBLL Bll = new BLL.Classes.ProcessoBLL();
        //
        // GET: /Processo/
        public ActionResult Index()
        {
            var listBll = Bll.GetAll();

            var modelList = new List<ProcessoModel>();

            foreach(var x in listBll)
            {
                modelList.Add(new ProcessoModel(x));

            }

            return View("List", modelList);
        }

        //
        // GET: /Processo/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Processo/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Processo/Create
        [HttpPost]
        public ActionResult Create(ProcessoModel model)
        {
            try
            {
                var p = model.ToRow();

                p.Id_Usuario_Atualiz = User.Identity.GetUserId();

                Bll.InsertUpdate(p);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Processo/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Processo/Edit/5
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
        // GET: /Processo/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Processo/Delete/5
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

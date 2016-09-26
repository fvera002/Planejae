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
            var model = new ProcessoModel();

            var allAtividades = Bll.GetAllAtividades();

            foreach(var atv in allAtividades)
            {
                model.Atividades.Add(new AtividadeModel(atv));
            }

            return View(model);
        }

        [HttpPost]
        public ActionResult Order(ProcessoModel processo)
        {
            var p = processo.ToRow();

            var usu = User.Identity.GetUserId();

            if (usu == null) return Redirect("/Account/Login");
            p.Id_Usuario_Atualiz = User.Identity.GetUserId();

            var idsAtividadesOrdenadas = from x in processo.Atividades
                                         orderby x.Order
                                         select x.Id;

            int? id = Bll.InsertUpdate(p, idsAtividadesOrdenadas.ToList());
            if (id.HasValue) processo.IdProcesso = id.Value;
            return RedirectToAction("Index");
        }

        //
        // POST: /Processo/Create
        [HttpPost]
        public ActionResult Create(ProcessoModel model)
        {
            try
            {
                
                var selecionadas = model.Atividades.Where(x => x.IsSelecionada);

                if (selecionadas != null || selecionadas.Count() > 0)
                {
                    var ids = selecionadas.Select(x => x.Id);
                    var atvs = Bll.GetAtividadesByIdsList(selecionadas.Select(x => x.Id));
                    var atvsModel = new List<AtividadeModel>();
                    foreach (var atv in atvs)
                    {
                        atvsModel.Add(new AtividadeModel(atv));
                    }
                    model.Atividades = atvsModel;

                }

                return View("Order", model);

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

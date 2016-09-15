using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Planejae.DAL.Classes;
using Planejae.BLL.Classes;
using System.Data;
using System.Linq;

namespace Planejae.UI.Tests.DAL
{
    [TestClass]
    public class Processo
    {
        private ProcessoDAL dal = new Planejae.DAL.Classes.ProcessoDAL();
        private ProcessoBLL bll = new Planejae.BLL.Classes.ProcessoBLL();

        [TestMethod]
        public void GetAll()
        {
            var list = bll.GetAll();

            Assert.IsNotNull(list);

            dal.InsertUpdate(
                "desc processo 1 ",
                "processo 1",
                "test");

            Assert.IsTrue(list.Count > 1);



        }
    }
}

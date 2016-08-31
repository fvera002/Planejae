using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Planejae.UI.Tests.BLL
{
    [TestClass]
    public class ObtemAtividade
    {
        [TestMethod]
        public void GetAllAtividades()
        {
            Planejae.BLL.Classes.AtividadeBLL bll = new Planejae.BLL.Classes.AtividadeBLL();

            Assert.IsNotNull(bll);

            var list = bll.GetAll();
            Assert.IsNotNull(list);

            Assert.IsTrue(list.Count > 0);
        }
    }
}

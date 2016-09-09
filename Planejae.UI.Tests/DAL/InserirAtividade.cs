using System;
using Planejae.DAL;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Planejae.DAL.Classes;

namespace Planejae.UI.Tests.DAL
{
    [TestClass]
    public class InserirAtividade
    {
        [TestMethod]
        public void InsertUpdate()
        {
            AtividadeDAL dal = new AtividadeDAL();

            var id  = dal.InsertUpdate(
                "descricao teste 1",
                1,
                1,
                1,
                "nome atividade",
                13,
                "5ca75560-3d20-43e5-b882-e6478f260355");

            Assert.IsNotNull(id);

        }
    }
}

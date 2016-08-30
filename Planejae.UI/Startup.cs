using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Planejae.UI.Startup))]
namespace Planejae.UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

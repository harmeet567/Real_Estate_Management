using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RealEstateDemo.Startup))]
namespace RealEstateDemo
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

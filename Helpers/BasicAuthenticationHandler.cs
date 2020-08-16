using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using TFG_FUTBOL.DataContext;
using TFG_FUTBOL.DataModels;

namespace TFG_FUTBOL.Helpers
{
    public class BasicAuthenticationHandler : AuthenticationHandler<AuthenticationSchemeOptions>
    {       
        private readonly TfgFutbolDataContext _context;

        public BasicAuthenticationHandler(
            IOptionsMonitor<AuthenticationSchemeOptions> options,
            ILoggerFactory logger,
            UrlEncoder encoder,
            ISystemClock clock,
            TfgFutbolDataContext context)
            : base(options, logger, encoder, clock)
        {            
            _context = context;
        }

        protected override async Task<AuthenticateResult> HandleAuthenticateAsync()
        {
            USUARIOS usuario = null;
            var nombreDeUsuario = Request.HttpContext.Session.GetString("UsuarioLogadoNombre");
            var contrasenha = Request.HttpContext.Session.GetString("UsuarioLogadoPassword");
            if (nombreDeUsuario != null && contrasenha != null)
            {
                //si hay datos en sessión, verificamos session
                return ValidarCredencialesAutorizacion(ref usuario, nombreDeUsuario, contrasenha);
            }
            else
            {
                //sino, preguntamos en los headers
                if (!Request.Headers.ContainsKey("Authorization"))
                {
                    return AuthenticateResult.Fail("Missing Authorization Data");
                }
                else
                {
                    return ValidarCredencialesAutorizacion(ref usuario, nombreDeUsuario, contrasenha);
                }
            }

            
                

            
            
        }

        private AuthenticateResult ValidarCredencialesAutorizacion(ref USUARIOS usuario, string nombreDeUsuario, string contrasenha)
        {
            try
            {
                if (nombreDeUsuario == null && contrasenha == null)
                {
                    var authHeader = AuthenticationHeaderValue.Parse(Request.Headers["Authorization"]);
                    var credentialBytes = Convert.FromBase64String(authHeader.Parameter);
                    var credentials = Encoding.UTF8.GetString(credentialBytes).Split(new[] { ':' }, 2);
                    nombreDeUsuario = credentials[0];
                    contrasenha = credentials[1];
                }                
                
                usuario = _context.USUARIOS.FirstOrDefault(u => u.NombreUsuario == nombreDeUsuario && u.Contrasenha == contrasenha);
            }
            catch (Exception ex)
            {
                return AuthenticateResult.Fail($"Invalid Authorization Header: {ex.Message}");
            }

            if (usuario == null)
                return AuthenticateResult.Fail("Invalid Username or Password");

            var claims = new[] {
                        new Claim(ClaimTypes.NameIdentifier, usuario.ID.ToString()),
                        new Claim(ClaimTypes.Name, usuario.NombreUsuario),
                        new Claim(ClaimTypes.Email, usuario.Correo),
                        new Claim(ClaimTypes.GivenName, usuario.Nombres),
                        new Claim(ClaimTypes.Surname, usuario.PrimerApellido),
                    };
            var identity = new ClaimsIdentity(claims, Scheme.Name);
            var principal = new ClaimsPrincipal(identity);
            var ticket = new AuthenticationTicket(principal, Scheme.Name);

            return AuthenticateResult.Success(ticket);
        }
    }
}

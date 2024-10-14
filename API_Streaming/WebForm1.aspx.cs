using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google.Apis.Services;
using Google.Apis.YouTube.v3;
using API_Streaming.Models;

namespace API_Streaming
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //API KEY que creamos
        string key = "AIzaSyCHavhUPYrQfjv-M4YVeBe0ts0xeMYUfJs";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Metodo que obtine un parametro para realizar una busqueda 
        private async Task GetYouTubeVideos(string buscar)
        {
            var youtubeService = new YouTubeService(new BaseClientService.Initializer()
            {
                ApiKey = key,
                ApplicationName = this.GetType().ToString()
            });
            var searchListRequest = youtubeService.Search.List("snippet");
            searchListRequest.Q = buscar;
            searchListRequest.MaxResults = 50;
            var searchListResponse = await searchListRequest.ExecuteAsync();


            List<VideoModel> listaVideos = new List<VideoModel>();
            foreach (var searchResult in searchListResponse.Items)
            {
                listaVideos.Add(new VideoModel()
                {
                    VideoId = searchResult.Id.VideoId,
                    Titulo = searchResult.Snippet.Title,
                    Imagen = searchResult.Snippet.Thumbnails.Medium.Url
                });

            }

            //LLena el GridView con los resultados
            gridVideos.DataSource = listaVideos;
            gridVideos.DataBind();

        }

        //Metodo que se ejecuta al precionar "Buscar" y usa el metodo de arriba para ejecutarlo con la busqueda como parametro
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string buscar = txtBuscar.Text;
            RegisterAsyncTask(new PageAsyncTask(() => GetYouTubeVideos(buscar)));
        }
    }
}


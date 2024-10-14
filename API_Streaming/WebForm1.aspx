<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="API_Streaming.WebForm1" Async="true" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title></title>
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css"/>
      <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
      <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <script>
        //Metodo javaScript que se encarga de reproducir el video
        function reproducirVideo(VideoId) {

            var srcVideo = "https://www.youtube.com/embed/" + VideoId + "?autoplay=1&loop=1";
            $("#frameVideo").attr("src", srcVideo);

        }
    </script>

  

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <!-- Barra de busqueda -->
                        <div class="form-group"  style="margin-top:50px">
                             <label for="txtBuscar">Buscar</label>
                            <asp:TextBox ID="txtBuscar" runat="server" CcsClass="Buscador"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <!-- Boton para realizar busqueda -->
                        <div class="form-group" style="margin-top:50px">
                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
  <br />
                        <!-- Titulo del Grid -->
                        <h1>Videos</h1>
                        <!-- GridView que cargara los videos -->
                        <asp:GridView runat="server" ID="gridVideos" AutoGenerateColumns="false" CssClass="table-responsive table table-borderer" >
                            <Columns>
                                <!-- Carga el titulo del video -->
                                <asp:BoundField DataField="Titulo" HeaderText="Titulo" />
                                <asp:TemplateField HeaderText="Imagen">
                                        <ItemTemplate>
                                            <!-- Carga la imagen/miniatura del video -->
                                             <asp:Image ID="Image1" runat="server" 
                                                       ImageUrl='<%# Eval("Imagen") %>' Width="100px" />
                                        </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Imagen">
                                      <ItemTemplate>
                                          <!-- Funciona como boton para llamar el metodo para reproducir el video -->
                                          <a href="javascript:reproducirVideo('<%# Eval("VideoId") %>')">reproducir</a>
                                        
                                      </ItemTemplate>
                              </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>
                     <!-- Reproduce el video en la ubicacion adecuada -->
                    <div class="col-md-6">
                        <iframe id="frameVideo" width="100%" height="450px" src="" frameborder="0" allow="autoplay" encrypted-media allowfullscreen></iframe>
                    </div>

                </div>
            </div>

        </div>
    </form>
</body>
</html>

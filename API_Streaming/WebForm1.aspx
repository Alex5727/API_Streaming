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
        function reproducirVideo(VideoId) {

            var srcVideo = "https://www.youtube.com/embed/" + VideoId + "?autoplay=1&loop=1";
            $("#frameVideo").attr("src", srcVideo);

        }
    </script>

    <style>
        
        .Buscador{
            margin-top:50px;
            width:250em;
        }

    </style>


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group"  style="margin-top:50px">>
                             <label for="txBuscar">Buscar</label>
                            <asp:TextBox ID="txBuscar" runat="server" CcsClass="Buscador"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group" style="margin-top:50px">
                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
  <br />
                        <h1>Videos</h1>
                        <asp:GridView runat="server" ID="gridVideos" AutoGenerateColumns="false" CssClass="table-responsive table table-borderer" >
                            <Columns>
                                <asp:BoundField DataField="Titulo" HeaderText="Titulo" />
                                <asp:TemplateField HeaderText="Imagen">
                                        <ItemTemplate>
                                             <asp:Image ID="Image1" runat="server" 
                                                       ImageUrl='<%# Eval("Imagen") %>' Width="100px" />
                                        </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Imagen">
                                      <ItemTemplate>
                                          <a href="javascript:reproducirVideo('<%# Eval("VideoId") %>')">reproducir</a>
                                        
                                      </ItemTemplate>
                              </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>

                    <div class="col-md-6">
                        <iframe id="frameVideo" width="100%" height="450px" src="" frameborder="0" allow="autoplay" encrypted-media allowfullscreen></iframe>
                    </div>

                </div>
            </div>

        </div>
    </form>
</body>
</html>

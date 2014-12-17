<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BostonBox_Startseite.aspx.cs" Inherits="Pages_Games_BostonBox_Startseite" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="myApp">
<head runat="server">
    <title></title>
    <link href="../packages/bootstrap.3.0.2/content/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/BostonBox/jumbotron-narrow.css" rel="stylesheet" />
</head>
<body ng-controller="DataCtrl">
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <ul class="nav nav-pills pull-right">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
                <h3 class="text-muted">Project name</h3>
            </div>

            <div class="jumbotron">
                <h1>Jumbotron heading</h1>
                <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
                <p><a class="btn btn-lg btn-success" href="#" role="button">Sign up today</a></p>
            </div>

            <div class="row marketing">
                <div class="col-lg-6" style="height:550px; background-image: url('../img/BostonBox/background.jpg')">
<%--                    <h4>Subheading</h4>
                    <p>Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum.</p>

                    <h4>Subheading</h4>
                    <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Cras mattis consectetur purus sit amet fermentum.</p>

                    <h4>Subheading</h4>
                    <p>Maecenas sed diam eget risus varius blandit sit amet non magna.</p>--%>
                </div>

                <div class="col-lg-6">
                    <h2>Game Objectives</h2>
                    <h4>Tutorials</h4>
                    <p>
                        <asp:Button ID="Button_dog" runat="server" Text="Dog Tutorial" OnClick="Button_dog_Click" />
                    </p>
                     <p>
                         <asp:Button ID="Button_cc" runat="server" Text="CC Tutorial" OnClick="Button_cc_Click" /><br />
                     </p>
                    <p>
                        <asp:Button ID="Button_qm" runat="server" Text="QM Tutorial" OnClick="Button_qm_Click" /><br />
                    </p>
                    <p>
                        <asp:Button ID="Button_star" runat="server" Text="Star Tutorial" OnClick="Button_star_Click" /><br />
                    </p>                                                          
                    <h4>Lessons</h4>
                    <p>
                        <asp:Button ID="Button_CCQM" runat="server" Text="Cash Cow and Questionmark" OnClick="Button_CCQM_Click" /><br />
                    </p>
                    <p>
                        <asp:Button ID="Button_3CCQM" runat="server" Text="Cash Cow and 3 Questionmarks" OnClick="Button_3CCQM_Click" /><br />
                    </p>
                    <h4>Game Play Mode</h4>
                    <p>
                        <asp:Button ID="Button_GamePlayMode" runat="server" Text="Game Play Mode" OnClick="Button_GamePlayMode_Click" /><br />
                    </p>
                </div>
            </div>
        </div>



        <%-- <div class="row" style="background-image: url('../img/BostonBox/background.jpg')">
                <div class="col-lg-7"></div>
                <div class="col-lg-3">
                   
                </div>
            </div>--%>
    </form>
</body>
</html>

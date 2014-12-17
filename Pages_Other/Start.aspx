<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Start.aspx.cs" Inherits="Start" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Interactive University</title>
    
    <link href="../packages/bootstrap.3.0.2/content/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../packages/bootstrap.3.0.2/content/Content/bootstrap.css" rel="stylesheet" />
   <link href="../Styles/Theme/justified-nav.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="container">


            <img class="img-responsive" src="../img/InteractiveUniversityLogo_flach.jpg" />


            <div class="jumbotron">
                <h2>Educational Software - done better</h2>
                <img class="img-responsive" src="../img/Start/start3.jpg" />
                <p class="lead">
                    <br/>
            I am developing a suite of interactive learning simulations, starting with business strategy topics.             
            Each topic will receive the attention it deserves: 
                   A full simulation, running smoothly in any modern browser,
                    teaching the full exam relevant theory to any student.
                </p>
                <%--<p><a class="btn btn-lg btn-success" href="#" role="button">Sign up today</a></p>--%>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail" style="height: 400px">
                        <img class="img-responsive" src="../img/BostonBox200.png" style="padding-top: 9px;" />
                        <div class="caption">
                            <h3>Boston Box / Growth Share Matrix</h3>
                            <p>
                                Manage a portfolio of products. 
                                Make the right investment decisions for the company's  Cash Cows, Questionmarks, Stars and Dogs.
                                Develop a healthy portfolio and optimize cash flow.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail" style="height: 400px">
                        <img class="img-responsive" src="../img/FiveForces200.png" style="padding-top: 9px;" />
                        <div class="caption">
                            <h3>Porter's Five Forces</h3>
                            <p>
                                Analyze the competitive landscape of your business. 
                                Study over 30 aspects of the market and aggregate them to a verdict
                                for each "Force", and for the overall market situation.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail" style="height: 400px">
                        <img class="img-responsive" src="../img/Start/Kanban.jpg" style="padding-top: 9px; width: 200px;" />
                        <div class="caption">
                            <h3>Kanban</h3>
                            <p>
                                Beginners walk through various Kanban systems and perform the steps. 
                                Advanced students setup a Kanban system themselves.
                            </p>
                            <br />
                            <br />
                            <h3>More topics coming soon.....</h3>
                        </div>
                    </div>
                </div>
            </div>

            <div style="height:80px">
                <ul class="nav nav-pills pull-left">
                    <li class="active"><a href="Pages_Other/Contact.aspx">Contact</a></li>
                </ul>
                <ul class="nav nav-pills pull-right">
                    <asp:Login ID="Login1" runat="server" placeholder="Username" DestinationPageUrl="~/Pages_Other/Übersichtsseite.aspx">
                        <LayoutTemplate>
                            <%--<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>--%>
                            <%--<input type="text" class="form-control" placeholder="Username" required="required" autofocus="autofocus" />--%>
                            <div>
                                <asp:TextBox ID="UserName" class="form-control" runat="server"></asp:TextBox>
                                <asp:TextBox ID="Password" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            </div>

                            <%--   <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>--%>
                            <%--<asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>--%>

                            <%--    <input type="password" class="form-control" placeholder="Password" required="required"/>--%>
                            <%--<asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>--%>

                            <%--<asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>--%>
                            <%--<button class="btn btn-default" type="submit">Sign in</button>--%>
                            <asp:Button ID="LoginButton" class="btn btn-default" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                        </LayoutTemplate>
                    </asp:Login>
                </ul>
                <%--<asp:LoginView ID="LoginView1" runat="server">
                </asp:LoginView>--%>
            </div>

            <div class="footer">
                <ul class="nav nav-pills pull-left">
                    <li>&copy; Interactive University 2013
                    </li>
                </ul>

            </div>

        </div>

    </form>
</body>
</html>

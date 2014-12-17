<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Übersichtsseite.aspx.cs" Inherits="Übersichtsseite" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="Scripts/jQuery1.8.js"></script>
    <link href="Styles/960_16_col.css" rel="stylesheet" />
    <link href="Styles/OverviewPage/OverviewPage.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            var element = document.getElementById("outerCenterDiv");
            var rect = element.getBoundingClientRect();

            var p = document.getElementById('placeholder');
            p.style.height = rect.bottom + 'px'  //rect.top + 40 + 'px';
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:LoginStatus ID="LoginStatus2" runat="server" />
        <div id="container" class="container_16">
            <div class="grid_3 alpha">
                <div id="placeholder">...</div>
            </div>
            <div class="grid_10" id="outerCenterDiv">
                <div class="grid_10">
                BUSINESS STRATEGY TOPICS
                <ul class="OV_list">
                    <li class="OV_Icons">
                        <a href="Pages_Games/BostonBox.aspx">
                            <img class="OV_Image" src="img/BostonBox200.png" />
                            <span class="OV_Text">Boston Box / Growth Share Matrix
                            </span>
                        </a>
                    </li>
                    <li class="OV_Icons">
                        <a href="Pages_Games/FiveForces.aspx">
                            <img class="OV_Image" src="img/FiveForces200.png" />
                            <span class="OV_Text">Porter's Five Forces Analysis
                            </span>
                        </a>
                    </li>
                    <li class="OV_Icons">
                        <a href="Pages_Games/Kanban.aspx">
                            <img class="OV_Image" src="img/Start/Kanban.jpg" />
                            <span class="OV_Text">Kanban
                            </span>
                        </a>
                    </li>

                    <li class="OV_Icons">
                        <a href="Pages_Other/Übersichtsseite.aspx">
                            <img class="OV_Image" src="img/LO_200.png" />
                            <span class="OV_Text">Linear Optimization
                            </span>
                        </a>
                    </li>
                </ul>
            </div>

            <div class='clear' style="height: 20px">&nbsp;</div>

            <div class="grid_10">
                COMPUTER SCIENCE TOPICS
                <ul class="OV_list">
                    <li class="OV_Icons">
                        <a href="Pages_Other/Übersichtsseite.aspx">
                            <img class="OV_Image" src="img/SQL200.png" />
                            <span class="OV_Text">SQL Trainer
                            </span>
                        </a>
                    </li>

                    <li class="OV_Icons">
                        <a href="Pages_Other/Übersichtsseite.aspx">
                            <img class="OV_Image" src="img/Regex200.png" />
                            <span class="OV_Text">Regular Expressions Trainer
                            </span>
                        </a>
                    </li>

                </ul>
            </div>
            </div>
            
            <div class="grid_3 omega"></div>

        </div>
    </form>
</body>
</html>

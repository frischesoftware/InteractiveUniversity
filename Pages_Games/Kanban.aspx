<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Kanban.aspx.cs" Inherits="Kanban" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kanban</title>
    <script src="../packages/jQuery.1.9.1/Content/Scripts/jquery-1.9.1.min.js"></script>      
    <script src="../packages/bootstrap.3.0.2/content/Scripts/bootstrap.min.js"></script>
    <script src="../packages/angularjs.1.2.2/content/Scripts/angular.min.js"></script>
    <script src="../Scripts/Lib/ngm-if.js"></script>
    <script src="../Scripts/Lib/svg.js"></script>

    <script src="../Scripts/Lib/SVG/drawShapes.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <button class="btn" id="Build_Stage0">replenish</button>
    <button class="btn" id="Stage2-1">replenish</button>
    <div id="svg"></div>        
    </div>
    </form>
        <script>
            var draw = SVG("svg").size(800, 500);
            $(function () {
                var objects = [];
                for (var i = 0; i < server_elements.length; i++) {
                    objects.push(server_elements[i]);
                }
                
                drawShapes(objects, 1, draw)
                var e = SVG.get('prod');
                //e.attr('xxx', 999);
                //alert($('#prod').attr("cx"));
                //var title = $("#prod").attr("cx");    

             //   alert($('#prod').attr("cx"));

            });
            $('#Stage2-1').click(function (e) {
                e.preventDefault();
                // suche aus allen teilen das passende / erste raus
                
                var one = $('.s2_p1');//.each();
                var two = $('.s2_p2');
                var set = draw.set();
                // set.add('s2_p1_01').add('s2_p2_01');
                set.add(SVG.get(one[0].id));
                set.add(SVG.get(two[0].id));
                set.animate(1000, '-', 100)
                   .move($('#prod').attr("cx") - 10, $('#prod').attr("cy") - 10);

                
                
            });
            $('#Build_Stage0').click(function (e) {
                e.preventDefault();
               
                var set = draw.set();

                var a = SVG.get('s1_p1_1');
                var b = SVG.get('s1_p2_1');
                set.add(a).add(b);

                set.animate(1000, '-', 100)
                   .move($('#prod').attr("cx") - 10, $('#prod').attr("cy") - 10);//fill('#ff0');
           


             
                /*
                SVG.get('eurostueck')  //s1_p1_1
                  .animate(1000, '-', 100)  //'>'
                  .move($('#prod').attr("cx") - 10, $('#prod').attr("cy") - 10);
                ;
                SVG.get('s1_p2_1')
                  .animate(1000, '=', 0)
                  .move($('#prod').attr("cx") - 10, $('#prod').attr("cy") - 10);
                  */
            });
        </script>
</body>
</html>
      //.attr({ fill: 'yellow' })
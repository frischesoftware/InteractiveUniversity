//angular.module('myApp', [])
angular.module('external_directives', [])
     .directive('dirCircleUnborn', function () {
         var radius = 10, abstandOben = 12, abstandLinks = 12;
         return function ($scope, elm, attrs) {
             var vis = d3.select(elm[0]).append("svg").attr("width", 24).attr("height", 24).attr("class", "circlesByDirective");;
             var node = vis.append("g").attr("class", "node");
             node.append("circle")
                 .data($scope.data_unborn_server)
                 .style("fill", function (d) {
                     for (var i = 0; i < $scope.data_unborn_server.length; i++) {
                         if ($scope.data_unborn_server[i].ci == $scope.$eval(attrs.theColor)) {
                             return $scope.data_unborn_server[i].primaryColor;
                         }
                     }
                 })
                 .style("stroke", function (d) {
                     for (var i = 0; i < $scope.data_unborn_server.length; i++) {
                         if ($scope.data_unborn_server[i].ci == $scope.$eval(attrs.theColor)) {
                             return $scope.data_unborn_server[i].secondaryColor;
                         }
                     }
                 }).style("stroke-width", 2)
                 .attr("r", radius).attr("cx", abstandOben).attr("cy", abstandLinks);           
         };
     })


         //<h1 hello name="name"></h1>
       //.directive('dirAdvisor_', function () {           
       //    return function ($scope, elm, attrs) {
       //        //restrict: 'EAC',
       //        //template: '<div> kleiner Test</div>'
       //        elm.text("hi");
       //    }
       //})
  

    .directive('dirAdvisor_2of3', function () {
        //return function ($scope, elm, attrs) {
        return {
            restrict: 'EAC',
            template: '<div> Product Manager for: {{d.marketName}}</div>' +
                         '<img width="30" style="float: left" src="{{d.advisor_imagesource}}" />' +
                         '<br />' +
                         '{{d.advisor_feedback}}'
        }
    })

    .directive('dirAdvisor', function () {
        //return function ($scope, elm, attrs) {
        return {
            restrict: 'EAC',
            template: 
                         '<img width="30" style="float: left" src="{{d.advisor_imagesource}}" />' +
                         '<br />' +
                         '<div>' +  //style="width: 95px"
                         '{{d.advisor_feedback}}' +
                         '</div>'
                            
        }
    })








//'<div style="width: 80px"> Product Manager for: {{d.marketName}}</div>' +

    /*
     .directive('dirAdvisorr', function () {
         //return function ($scope, elm, attrs) {
         if (true) {
             return {
                 restrict: 'EAC',
                 template: 'd: {{d.marketName}} p:{{p.marketName}}'
             }
         }

         
     })

      .directive("hello", function () {
          return function ($scope, elm, attrs) {
              elm.text("hello, d: {{d.marketName}} p:{{p.marketName}}" + $scope.gamedata[0].currentActiveGame);
          }
      })
      */


    .directive('dirCircleActive', function () {
          var radius = 10, abstandOben = 12, abstandLinks = 12;
          return function ($scope, elm, attrs) {
              var vis = d3.select(elm[0]).append("svg").attr("width", 24).attr("height", 24).attr("class", "circlesByDirective");;
              var node = vis.append("g").attr("class", "node");
              node.append("circle")
                  .data($scope.data)
                  .style("fill", function (d) {
                      for (var i = 0; i < $scope.data.length; i++) {
                          if ($scope.data[i].ci == $scope.$eval(attrs.theColor)) {
                              return $scope.data[i].primaryColor;
                          }
                      }
                  })
                  .style("stroke", function (d) {
                      for (var i = 0; i < $scope.data.length; i++) {
                          if ($scope.data[i].ci == $scope.$eval(attrs.theColor)) {
                              return $scope.data[i].secondaryColor;
                          }
                      }
                  }).style("stroke-width", 2)
                  .attr("r", radius).attr("cx", abstandOben).attr("cy", abstandLinks);

              node.append("svg:text")
                  .data($scope.data)
                  .attr("class", "asdf").attr("x", 12).attr("y", 12).style("font-size", "12 px")  //.attr("x", function (d) { return 10; })
                  .attr("text-anchor", "middle")
                  .attr("dy", ".35em")
                  //.attr("font-family", "Conv_framd")
                  .attr("font-size", "14px")
                  .attr("fill", "white")

                  .text(function (d) {
                      //return $scope.indexforDirScope()
                      for (var i = 0; i < $scope.data.length; i++) {
                          if ($scope.data[i].ci == $scope.$eval(attrs.theColor)) {
                              return $scope.data[i].circleText;
                          }
                      }
                  });
          };
      });
           

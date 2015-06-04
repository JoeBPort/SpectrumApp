<%@ Page Title="Home Page" Language="C#"  AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Spectrum2._Default" %>
    <!DOCTYPE html >

    <head id="Head1" runat="server">
        <title></title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular-route.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 

    </head>
<body id="control" ng-app="spectrum"  ng-controller="customers" >

<script>
    

 var spectrum = angular.module('spectrum', ['ngRoute']);
    
 //configure routes
 spectrum.config(['$routeProvider', '$locationProvider', function($routeProvider) {
  
    $routeProvider.
    when('/', {
        templateUrl: 'customerlist.aspx'   
    }).when('/custinfo', {
        templateUrl: 'customerinfo.aspx'
    }).when('/new', {
        templateUrl: 'newcustomer.aspx'
    }).otherwise({
        redirectTo: '/'
      
    });
      
}]);

//this is the main controller
spectrum.controller('customers', function ($scope, $http) {

    $scope.list;


    $scope.customerList = function () {

        $.ajax({
            type: "POST",
            url: "WebService1.asmx/Populate",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $scope.list = $.parseJSON(data.d);
            },
            error: function (XHR, errStatus, errorThrown) {
                var err = JSON.parse(XHR.responseText);
                errorMessage = err.Message;
                alert(errorMessage);
            }
        });
    };

    $scope.custinfo = function (index) {

        $scope.pos = index;
    };


    $scope.newcustomer = function () {

       
        fname = document.getElementById('txtFname').value;
        lname = document.getElementById('txtLname').value;
        address = document.getElementById('txtAddress').value;
        city = document.getElementById('txtCity').value;
        state = document.getElementById('txtState').value;
        phone = document.getElementById('txtPhone').value;


        $.ajax({
            type: "POST",
            url: "WebService1.asmx/newCustomer",
            data: "{'fname':'" +
        fname + "','lname':'" + lname + "','address':'" + address + "','city':'" + city +
        "','state':'" + state + "','phone':'" +
        phone + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                alert(msg.d);
            },
            error: function (msg) {
                alert(msg.d);
            }
        });


    };


    $scope.update = function () {

        fname = document.getElementById('txtFname').value;
        lname = document.getElementById('txtLname').value;
        address = document.getElementById('txtAddress').value;
        city = document.getElementById('txtCity').value;
        state = document.getElementById('txtState').value;
        phone = document.getElementById('txtPhone').value;
        cid = parseInt(document.getElementById('txtCID').value);


        //'cid':,'" + cid + "',
        $.ajax({
            type: "POST",
            url: "WebService1.asmx/updateCustomer",
            data: "{'cid':'" + cid + "','fname':'" +
        fname + "','lname':'" + lname + "','address':'" + address + "','city':'" + city +
        "','state':'" + state + "','phone':'" +
        phone + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (msg) {
                alert(msg.d);
            },
            error: function (msg) {
                alert(msg.d);
            }
        });


    };

    $scope.save = function (whichone) {

        if (whichone == 'newcust') {
            $scope.newcustomer();
        }
        else if (whichone == 'update') {
            $scope.update();
        }

    }

});
</script>

<div id="view" ng-view style="padding: 0px;" ></div> 

     <form id="form1" runat="server">
           <!-- <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>-->
             </form>
   
     
</body>


</html>
  
</asp:Content>



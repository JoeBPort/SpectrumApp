
 
 <div align= "center">

    <table>
        <thead>
            <tr>
                <th></th> <th>First Name</th> <th>Last Name</th>
                
            </tr>
        </thead>
            <tr ng-repeat="cust in list">
                <td><a href="#/custinfo" ng-click="custinfo($index);">Edit</a></td> <td>{{cust.Fname}}</td> <td>{{cust.Lname}}</td>
            </tr>
    </table>     
     
<input type="button" id="btnFetch" value="Get Customer List" ng-click="customerList();" /><a href="#/new"><input type="button" id="Button1" value="Add Customer" /></a>



</div>

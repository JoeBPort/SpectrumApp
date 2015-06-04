
<div align="center" style="font-family: Verdana; font-size: 12px;">
            <table>
                
              <tr>
                    <td style="text-align: right;">First Name :
                    </td>
                    <td>
                        <input type="text" id="txtFname" value="{{list[pos].Fname}}" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">Last Name : 
                    </td>
                    <td>
                        <input type="text" id="txtLname" value="{{list[pos].Lname}}"/>
                    </td>
                </tr>

                <tr>
                    <td style="text-align: right;">Address:
                    </td>
                    <td>
                        <input type="text" id="txtAddress" 
                        value="{{list[pos].Address}}"></input>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">City :
                    </td>
                    <td>
                        <input type="text" id="txtCity" value="{{list[pos].City}}" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">State :
                    </td>

                    <td>
                        <input type="text" id="txtState" value="{{list[pos].State}}" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">Phone:
                    </td>
                    <td>
                        <input type="text" id="txtPhone" value="{{list[pos].Phone}}" />
                       <input type="hidden" id="txtCID" value={{list[pos].CID}} />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td colspan="2" style="text-align: center;">
                        
                        <input type="button" id="Button2" ng-click="save('update');" value="Save"/>
                        <a href="#/customer"><input type="button" id="Button1" value="Back"/></a>
                    </td>
                </tr>

            </table>
            
      
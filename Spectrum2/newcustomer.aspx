
<div align="center" style="font-family: Verdana; font-size: 12px;">
            <table>
                
              <tr>
                    <td style="text-align: right;">First Name :
                    </td>
                    <td>
                        <input type="text" id="txtFname" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">Last Name : 
                    </td>
                    <td>
                        <input type="text" id="txtLname" />
                    </td>
                </tr>

                <tr>
                    <td style="text-align: right;">Address:
                    </td>
                    <td>
                        <input type="text" id="txtAddress"></input>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">City :
                    </td>
                    <td>
                        <input type="text" id="txtCity"  />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">State :
                    </td>

                    <td>
                        <input type="text" id="txtState" " />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">Phone:
                    </td>
                    <td>
                        <input type="text" id="txtPhone"  />
                       <input type="hidden" id="txtCID"  />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td colspan="2" style="text-align: center;">
                        
                        <input type="button" id="Button2" ng-click="save('newcust');" value="Add"/>
                        <a href="#/customer"><input type="button" id="Button1" value="Back"/></a>
                    </td>
                </tr>

            </table>
            
      
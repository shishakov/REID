<%@ page import="com.reid.REID.Customer" %>
<html>
    <head>

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'ui.jqgrid.css')}" type="text/css">
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui.css')}" type="text/css">
        <g:javascript library="grid_local_en" />
        <g:javascript library="jquery_lib"/>
        <g:javascript library="jquery_ui" />
        <g:javascript library="jquery_grid" />
        <r:layoutResources />
    </head>
    <body>
        <div class="body">
            <h1>Customer List</h1>

            <div id='message' class="message" style="display: none;"></div>

            <!--table tag will hold our grid -->
            <table id="customer_list" class="scroll jqTable" cellpadding="0" cellspacing="0"></table>
            <!-- pager will hold our padinator -->
            <div id="customer_list_pager" class="scroll" style="text-align: center;"></div>

            <div style="margin-top: 5px">
                <input class="ui-corner-all" id="btnAdd" type="button" value="Add Record"/>
                <input class="ui-corner-all" id="btnEdit" type="button" value="Edit Selected Record"/>
                <input class="ui-corner-all" id="btnDelete" type="button" value="Delete Selected Record"/>
            </div>

            <script type="text/javascript">
                var lastSelectedId;

                /* when the page finished loading.. execute the following */
                $(document).ready(function() {
                    // set on click events for non toolbar buttons
                    $("#btnAdd").click(function(){
                                $("#customer_list").jqGrid("editGridRow","new",
                                        {addCaption:'Create New Customer',
                                        afterSubmit:afterSubmitEvent,
                                            savekey:[true,13]
                                        }
                                );
                            }

                    );

                    $("btnEdit").click(function(){
                                var gr = $("#customer_list").jqGrid('getGridParam','selrow');
                                if( gr != null)
                                    $("#customer_list").jqGrid('editGridRow',gr,
                                            {closeAfterEdit:true,
                                            afterSubmit:afterSubmitEvent});
                                else
                                    alert("Please Select Row");
                            }

                    );

                    $("btnDelete").click(function(){
                                var gr = $("#customer_list").jqGrid('getGridParam','selrow');
                                if( gr != null)
                                    $("#customer_list").jqGrid('delGridRow',gr,
                                            {closeAfterEdit:true,
                                                afterSubmit:afterSubmitEvent});
                                else
                                    alert("Please Select Row to delete");
                            }

                    );

                    $("#customer_list").jqGrid({
                        url:'jq_customer_list',
                        editurl:'jq_edit_customer',
                        datatype:"json",
                        colName:['First Name', 'Last Name', 'Age', 'Email Address', 'id'],
                        colModel:[
                            {name:'firstName',
                            editable:true,
                            editrules:{required:true}
                            },
                            {name:'lastName',
                            editable:true,
                            editrules:{required:true}
                            },
                            {name:'age',
                             editable:true,
                             editoptions:{size:3},
                             editrules:{requred:true, integer:true}
                            },
                            {name: 'emailAddress',
                             editable:true,
                             editoptions:{size:30},
                             editrules:{requred:true, integer:true}
                            },
                            {name: id, hidden:true}
                        ],
                        rowNum:2,
                        rowList:[1,2,3,4],
                        pager:'#customer_list_pager',
                        viewrecords: true,
                        gridview: true
                    }).navGrid('#customer_list_pager',
                            {add:true, edit:true, del:true, search:false, refresh: true},
                            {closeAfterEdit:true,
                            afterSubmit: afterSubmitEvent},
                            {addCaption:'Create New Customer',
                                afterSubmit: afterSubmitEvent,
                                savekey:[true,13]
                            },
                            {afterSubmit: afterSubmitEvent}
                    );

                    $("#customer_list").jqGrid('filterToolBar', {autosearch:true});
                });
                function afterSubmitEvent(response, postdata){
                    var success = true;
                    console.log ('here')
                    var json = eval('('+response.responseText+')');
                    var message = json.message;

                    if(json.state == 'FAIL') {
                        success = false;
                    }else{
                        $('#message').html(message);
                        $('#message').show().fadeOut(1000);
                    }

                    var new_id = json_id
                    return [success, message, new_id];
                }
                </script>
            </div>
    <r:layoutResources />
    </body>
</html>
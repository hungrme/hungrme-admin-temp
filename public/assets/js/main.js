// var table = new Tabulator("#example-table", {
// 	data:tabledata,           //load row data from array
// 	layout:"fitColumns",      //fit columns to width of table
// 	responsiveLayout:"hide",  //hide columns that dont fit on the table
// 	tooltips:true,            //show tool tips on cells
// 	addRowPos:"top",          //when adding a new row, add it to the top of the table
// 	history:true,             //allow undo and redo actions on the table
// 	pagination:"local",       //paginate the data
// 	paginationSize:7,         //allow 7 rows per page of data
// 	movableColumns:true,      //allow column order to be changed
// 	resizableRows:true,       //allow row order to be changed
// 	initialSort:[             //set the initial sort order of the data
// 		{column:"name", dir:"asc"},
// 	],
// 	columns:[                 //define the table columns
// 		{title:"Name", field:"name", editor:"input"},
// 		{title:"Task Progress", field:"progress", hozAlign:"left", formatter:"progress", editor:true},
// 		{title:"Gender", field:"gender", width:95, editor:"select", editorParams:{values:["male", "female"]}},
// 		{title:"Rating", field:"rating", formatter:"star", hozAlign:"center", width:100, editor:true},
// 		{title:"Color", field:"col", width:130, editor:"input"},
// 		{title:"Date Of Birth", field:"dob", width:130, sorter:"date", hozAlign:"center"},
// 		{title:"Driver", field:"car", width:90,  hozAlign:"center", formatter:"tickCross", sorter:"boolean", editor:true},
// 	],
// });


$( document ).ready(function() {

$(document).on("click", "#add-branch-btn", addBranch);


$(document).on("click", "#add-tab", onAddTabClick);



var EDIT_MODE= false;


var ajaxConfig = {
    method:"get", //set request type to Position
    headers: {
        "Content-type": 'application/json; charset=utf-8', //set specific content type
    },
};

function btn_create(cell, formatterParams, onRendered){ //plain text value

    var uploadBtnn = '<button type="submit" id="OpenImgUpload">ID upload</button></form>'
    return uploadBtnn
};

function branches_retrieve(){

    $.get("/branch", function (e) {
    
    var table = new Tabulator("#example-table", {
        height:"311px",
        layout:"fitData",
        data:e, 
        layout:"fitColumns",
        placeholder:"No Data Set",
        ajaxContentType:"json",
        columns:[
            {title:"Branch ID", field:"branchId"},
            {title:"Branch Name", field:"branchName"},
            {title:"Merchant ID", field:"merchantId"},
            {title:"Merch. Name", field:"businessName"},
            {title:"Address", field:"address"},
            {title:"Phone", field:"telephone"},
            {title:"X-Coor", field:"xCoordinate"},
            {title:"Y-Coor", field:"yCoordinate"},
            {title:"Edit", field: "edit" ,formatter:btn_create,width:100, hozAlign:"center",cellClick:function(e, cell){ 

                //button's function for example 
                var btn = document.createElement('Button');
                btn.textContent = "Edit"
                btn.id = "Btn_Id";
                btn.style.background = "red";
                console.log("Printing row data for: " + cell.getRow().getData().branchId);
                
                
                }
            }
        ],

        rowClick:function(e, row){

          console.log(row.getData().branchName);

          
          EDIT_MODE = true;
          activaTab("add",row.getData())
        }
        
    });                                                                                 

})

}



    // Handler for .ready() called.


function onAddTabClick(){
  EDIT_MODE = false;
  setupEditMode();
}



function edit_btn(e, cell){
    console.log(e, cell)
}

  function onInit(){

    branches_retrieve();

  }



  function addBranch(){

    var branchId_ = $("#branchid").val();
    var branchName_ = $("#branchname").val();
    var merchantId_ = $("#merchantid").val();
    var phone_ = $("#phone").val();
    var address_ = $("#address").val();
    var xCoordinate_ = $("#xcoordinate").val();
    var yCoordinate_ = $("#ycoordinate").val();

    var obj = {
        branchId: branchId_,
        branchName: branchName_,
        merchantId: merchantId_,
        phone: phone_,
        address: address_,
        xCoordinate: xCoordinate_,
        yCoordinate: yCoordinate_


    }

    $.post("/add_branch",obj, function (response){

        console.log(response);

    })

  }


//   function onInit(){

//     var href = window.location.href;

//     console.log(href)
//     if (href.includes("#")){

//         var keyword = href.substring(href.indexOf("#")+1)


//         console.log(keyword)
//         switch (keyword){

//             case 'home' : {
//                 activaTab("home");
//                 break;
//             }
//             case 'add' : {
                
//                 activaTab("add");
//                 activaTab("add");
//                 break;
//             }
//             case 'edit' : {
//                 activaTab("edit");
//                 console.log("edit")
//                 break;
//             }
//         }

//     }


// }

function activaTab(tab, rowData){
    $('.nav-tabs a[href="#' + tab + '"]').tab('show');

    console.log(EDIT_MODE)
    setupEditMode(rowData);

  };


  function setupEditMode(rowData){
    if (EDIT_MODE){

      // console.log("edit mode")
    $("#update-branch-btn").show();
    $(".branch-form-msg").show();
    $("#add-branch-btn").hide();

    $("#branchid").val(rowData.branchId);
    $("#branchname").val(rowData.branchName);
    $("#merchantid").val(rowData.merchantId);
    $("#merchantname").val(rowData.businessName);
    $("#phone").val(rowData.telephone);
    $("#address").val(rowData.address);
    $("#xcoordinate").val(rowData.xCoordinate);
    $("#ycoordinate").val(rowData.yCoordinate);

    }
    else
    {
      $("#update-branch-btn").hide();
      $(".branch-form-msg").hide();
      $("#add-branch-btn").show();

    }

  }

  
  onInit();

  
 });
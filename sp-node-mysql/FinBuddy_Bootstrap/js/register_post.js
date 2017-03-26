$("#reg").click(function()){
    var data = {};
    data["user_id"] = document.getElementById("email").value;
    data["password"] = document.getElementById("password").value;
    data["name"] = document.getElementById("name").value;
    data["create_date"] = new Date();
});

$http({
    method: 'POST';
    url: 'https://155.246.213.64:3000/users/';
    data: data;
});

success(function(data)){
    if(data.errors){
        console.log("error");
        console.log(data);
    } else {
        console.log("success");
        console.log(data);
    }
};
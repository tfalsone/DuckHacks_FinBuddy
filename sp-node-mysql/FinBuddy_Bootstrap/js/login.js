$("#myForm").submit(function(e){
     e.preventDefault();
    $.get('http://155.246.213.64:3000/users/' + document.getElementById('email').value, function(response){
        console.log(response);
        if(response.length === 0){
            alert("Username or password entered is incorrect.");
        }
        else{
            if(document.getElementById("password").value == response[0]['password']){
                localStorage.setItem("user_id", document.getElementById('email').value);
                window.location.href = "dashboard.html";
            }
            else{
                alert("Username or password entered is incorrect.");
            }
        }
    });
});